# typed: strict
# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'action_cable/engine'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0
    config.assets.enabled = true
    config.middleware.insert_before 0, Rack::Attack

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    # config.autoload_lib(ignore: %w[assets tasks])
    # config.active_job.queue_adapter = :async

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    # Use Propshaft for asset pipeline
    config.assets.paths << Rails.root.join('app/assets/stylesheets')
    config.assets.paths << Rails.root.join('app/javascript')
    config.assets.paths << Rails.root.join('node_modules')

    config.time_zone = 'Eastern Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
