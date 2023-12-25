Rails.application.config.after_initialize do
    ActionText::ContentHelper.allowed_tags.add 'align-right'
    ActionText::ContentHelper.allowed_tags.add 'align-center'
    ActionText::ContentHelper.allowed_tags.add 'align-left'
  end
  