require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    Rails.application.config.default_url_options = { host: 'localhost', port: 5000 }
    Rails.application.default_url_options= { host: 'localhost', port: 5000 }
    # Configuration for the application, engines, and railties goes here.
    # config/application.rb
   
    
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Eastern Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
