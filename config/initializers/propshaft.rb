Rails.application.config.assets.compile = true

# Ensure we have a fallback path for the application root
Rails.application.config.after_initialize do
  if Rails.application.config.respond_to?(:root) && Rails.application.config.root.nil?
    Rails.application.config.define_singleton_method(:root) do
      Rails.root
    end
  end
end