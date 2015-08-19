# Copyright (C) 2013, InSTEDD
#
# This file is part of InSTEDD Bootstrap.
#
# InSTEDD Bootstrap is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# InSTEDD Bootstrap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with InSTEDD Bootstrap.  If not, see <http://www.gnu.org/licenses/>.

module InsteddBootstrap
  module ApplicationHelper
    def add_body_class(css_class)
      @body_class = "#{css_class} #{@body_class}"
    end

    def top_nav_bar
      content_for :top_nav_bar do
        yield
      end
    end

    def top_nav_bar_item(text, path, active = false)
      active ||= request.path == path
      haml_tag :li, class: "#{'active' if active}" do
        haml_concat link_to(text, path)
      end
    end

    def breadcrumb
      haml_tag :ul, class: "breadcrumb" do
        @breadcrumb_items = []
        yield

        @breadcrumb_items.each_with_index do |item, index|
          if index == @breadcrumb_items.length - 1
            _breadcrumb_last_item item[:text]
          else
            _breadcrumb_item item[:text], item[:path]
          end
        end
      end
    end

    def breadcrumb_item(text, path = nil)
      @breadcrumb_items << { text: text, path: path }
    end

    def _breadcrumb_item(text, path)
      haml_tag :li do
        haml_concat link_to(text, path)
      end
    end

    def _breadcrumb_last_item(text)
      haml_tag :li, class: 'active' do
        haml_tag :span
        haml_concat text
      end
    end

    def feature_carrousel
      haml_tag :div, class: 'features-container' do
        haml_tag :ul do
          yield
        end
      end
    end

    def feature_carrousel_item(title, options)
      haml_tag :li do
        if options[:image]
          haml_tag :img, src: options[:image]
        end

        if options[:image_class]
          haml_tag :i, class: options[:image_class]
        end

        haml_tag :h3, :< do
          concat title
        end

        haml_tag :p, :< do
          yield
        end
      end
    end

    def dropdown(text, &block)
      body = capture(&block)
      concat(render("instedd/controls/dropdown", text: text, body: body))
    end

    def dropdown_item(text, path, options={})
      haml_tag :li do
        haml_concat link_to(text, path, options)
      end
    end

    def dropdown_divider
      haml_tag :li, class: 'divider'
    end

    def simple_list(key, options = {}, &block)
      create_path = options[:create_path]
      title = options[:title] || t("#{key}.title", scope: [:instedd, :controls, :simple_list], default: key.to_s.humanize.pluralize.titleize)
      icon_key = options[:icon] || key
      if icon_key.is_a?(Symbol)
        emptydata_style = "background: url(#{asset_path('instedd-bootstrap/icons/72/grey/' + icon_key.to_s + '.png')}) no-repeat center 40px !important;"
      end

      body = capture(&block) if block_given?
      locals = {
        key: key,
        title: title,
        create_path: body.present? ? create_path : nil
      }
      concat(render(layout: "instedd/controls/simple_list", locals: locals) do
        if body.present?
          haml_concat body
        else
          concat render("instedd/controls/simple_list_empty", key: key, path: create_path, emptydata_style: emptydata_style)
        end
      end)
    end

    def simple_list_item(text, path)
      concat render("instedd/controls/simple_list_item", text: text, path: path)
    end

    def crud_list(key, items)
      items.each do |item|
        concat(render("instedd/controls/crud_list_item", {
          key: key,
          model: item,
          expanded: false
        }))
      end

      concat(render("instedd/controls/crud_list_add", {
        key: key,
        title: "Add #{key.to_s.humanize.titleize}",
        create_model: controller._crud_create_model(key)
      }))
    end

    def crud_list_cancel
      haml_tag :button, "Cancel", type: "reset", class: "btn btn-link", onclick: "$(this).closest('.collapse').collapse('hide')"
    end

    def flash_message
      res = nil

      keys = { :notice => 'flash_notice', :error => 'flash_error', :alert => 'flash_error' }

      keys.each do |key, value|
        if flash[key]
          html_option = { :class => "flash #{value}" }
          html_option[:'data-hide-timeout'] = 3000 if key == :notice
          res = content_tag :div, html_option do
            content_tag :div do
              flash[key]
            end
          end
        end
      end

      res
    end

    def render_breadcrumbs
      unless @breadcrumbs.nil? or @breadcrumbs.empty?
        breadcrumb do
          @breadcrumbs.each do |item|
            breadcrumb_item item[:name], item[:url]
          end
        end
      end
    end

    def icon_link_to(icon, body, url, html_options = {})
      html_options[:class] = "btn-icon #{html_options[:class]}"
      before = html_options.delete :before

      link_to url, html_options do
        if before and before.present?
          haml_tag :span, :< do
            haml_concat h(before)
          end
        end
        haml_tag :span, class: 'ic-wrapper' do
          haml_tag :i, :<, class: icon
        end
        if body and body.present?
          haml_tag :span, :< do
            haml_concat h(body)
          end
        end
      end
    end

    def full_row
      haml_tag :div, class: 'row-fluid' do
        haml_tag :div, class: 'span12' do
          yield
        end
      end
    end

    def render_errors(resource)
      if resource.errors.any?
        concat (render "instedd/controls/form_errors.haml", :resource => resource)
      end
    end

    def collapsible_form_for(url, options)
      haml_tag :div, class: 'collapsible_form_for_container' do
        haml_concat icon_link_to "icf-#{options[:icon]}", options[:title], "##{options[:id]}", data: { toggle: 'collapse', target: "##{options[:id]}"}, class: 'expand_button'

        haml_tag :div, id: options[:id], class: 'collapse panel-collapse collapsible' do
          haml_tag :div, class: 'panel-body' do

            haml_tag :a, data: { toggle: 'collapse', target: "##{options[:id]}"}, class: 'pull-left' do
              haml_tag :span do
                haml_tag :i, class: 'icfg-import import-button-collapsed'
              end
            end

            haml_tag :span, class: 'action-description pull-left' do
              haml_tag :span do haml_concat options[:title] end
              haml_tag :br
              haml_tag :span do haml_concat options[:description] end
            end

            haml_tag :hr, style: "clear:both"

            haml_tag :div do

              form = form_tag url, multipart: true, class: 'form-inline' do |f|
                yield
                haml_concat link_to 'Cancel', '#', class: 'btn btn-link', data: { toggle: 'collapse', target: "##{options[:id]}"}
                haml_concat button_tag options[:submit], class: 'btn'
              end

              haml_concat form
            end
          end
        end
        haml_tag :br, style: "clear:both"

      end
    end


  end
end

ActionController::Base.send :helper, InsteddBootstrap::ApplicationHelper
ActionController::Base.send :include, InsteddBootstrap::ApplicationHelper
