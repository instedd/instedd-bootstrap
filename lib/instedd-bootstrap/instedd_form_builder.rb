class InsteddFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(attribute, options = {})
    return super(attribute, options) if options[:skip_formatting]
    @template.render("instedd/controls/text_field", {f: self, attribute: attribute, options: options})
  end

  def submit(*args)
    options = args.extract_options!
    super(*args, {class: 'btn'}.merge!(options))
  end

end
