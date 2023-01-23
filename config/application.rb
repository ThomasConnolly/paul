# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'csv'
Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.action_view.form_with_generates_remote_forms = false

    Rails.application.config.default_url_options = { host: 'localhost', port: 5000 }
    Rails.application.default_url_options = { host: 'localhost', port: 5000 }
    Rails.application.config.active_storage.variant_processor = :mini_magick

    # Configuration for the application, engines, and railties goes here.
    # config/application.rb

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Eastern Time (US & Canada)'
    config.eager_load_paths += %W(#{config.root}/lib)
  end
end
