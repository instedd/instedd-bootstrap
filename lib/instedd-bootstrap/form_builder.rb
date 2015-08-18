class ActionView::Helpers::FormBuilder

  def ibs_text_field(attribute, options = {})
    @template.render("instedd/controls/text_field", {f: self, attribute: attribute, options: options})
  end

  def ibs_submit(*args)
    options = args.extract_options!
    submit(*args, {class: 'btn'}.merge!(options))
  end

end
