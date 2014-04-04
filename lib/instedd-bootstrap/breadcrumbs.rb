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

# source
# https://raw.githubusercontent.com/seyhunak/twitter-bootstrap-rails/master/lib/twitter/bootstrap/rails/breadcrumbs.rb
module InsteddBootstrap
  module Breadcrumbs
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def add_breadcrumb(name, url = '', options = {})
        options.merge! :klass => self.name
        before_filter options do |controller|
          controller.send :add_breadcrumb, name, url, options
        end
      end
    end

    protected

    def add_breadcrumb(name, url = '', options = {})
      @breadcrumbs ||= []

      class_name = options.delete(:klass) || self.class.name

      if name.is_a? Symbol
        if url.blank?
          url_helper = :"#{name}_path"
          url = url_helper if respond_to?(url_helper)
        end

        name = translate_breadcrumb name, class_name
      end

      unless name.is_a? String
        url = polymorphic_path name if url.blank?
        name = name.to_s
      end

      url = eval(url.to_s) if url.is_a?(Symbol) && url =~ /_path|_url|@/

      @breadcrumbs << {:name => name, :url => url, :options => options}
    end

    def translate_breadcrumb(name, class_name)
      scope = [:breadcrumbs]
      namespace = class_name.underscore.split('/')
      namespace.last.sub!('_controller', '')
      scope += namespace

      I18n.t name, :scope => scope
    end
  end
end

ActionController::Base.send :include, InsteddBootstrap::Breadcrumbs
