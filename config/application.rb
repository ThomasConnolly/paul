# typed: false
# frozen_string_literal: true

require_relative 'boot'

# Instead of require 'rails/all'
require 'rails'
# Include all railties manually, excluding sprockets
%w[
  active_record/railtie
  active_storage/engine
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  action_mailbox/engine
  action_text/engine
  rails/test_unit/railtie
].each do |railtie|
  require railtie
rescue LoadError
end

# Explicitly require propshaft
require 'propshaft'
require 'action_cable/engine'
require 'csv'

Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0
    config.asset_pipeline = :propshaft
    config.middleware.insert_before 0, Rack::Attack
    config.action_controller.default_protect_from_forgery = true
    config.time_zone = 'Eastern Time (US & Canada)'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
