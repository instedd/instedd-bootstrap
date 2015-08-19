module InsteddBootstrap
  module CrudLists
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def crud_list_options(key, options)
        @crud_list_options ||= {}
        @crud_list_options[key] = { new: 'new', edit: 'edit' }.merge!(options)
      end

      def _crud_list_option(key, option)
        @crud_list_options[key][option]
      end
    end

    protected

    def crud_list_append(key, model)
      {
        partial: 'instedd/controls/crud_list_append',
        locals: {
          key: key,
          model: model,
          create_model: _crud_create_model(key)
        }
      }
    end

    def crud_list_new(key, model)
      {
        partial: 'instedd/controls/crud_list_new',
        locals: {
          key: key,
          model: model
        }
      }
    end

    def crud_list_update(key, model, options = {})
      {
        partial: 'instedd/controls/crud_list_update',
        locals: {
          key: key,
          model: model,
          expanded: options[:expanded]
        }
      }
    end

    def crud_list_remove(key, model)
      {
        partial: 'instedd/controls/crud_list_remove',
        locals: {
          key: key,
          model: model
        }
      }
    end

    public

    def _crud_list_title(key, model)
      title = _crud_list_option(key, :title)
      title_was = "#{title}_was".to_sym
      # due to validations, if collapsing is better to show the saved attribute

      model.send(model.respond_to?(title_was) ? title_was : title)
    end

    def _crud_list_option(key, option)
      self.class._crud_list_option(key, option)
    end

    def _crud_create_model(key)
      key.to_s.camelize.constantize.new
    end

    def _crud_item_id(key, model)
      "item-#{key}-#{model.id}"
    end

    def _crud_create_id(key)
      "create-#{key}"
    end
  end
end

ActionController::Base.send :include, InsteddBootstrap::CrudLists
