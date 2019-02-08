require_relative 'boot'

require 'rails/all'
require 'csv'
require 'date'
require 'time'
require 'attachinary/orm/active_record'
require 'sprockets/railtie'
require 'rspec-rails'
require 'awesome_print'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over these.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded
  config.load_defaults 5.2
  config.time_zone = 'Eastern Time (US & Canada)'
  config.active_record.default_timezone = :local
  config.assets.precompile+=Ckeditor.assets
  config.assets.precompile+=%w(ckeditor/*)
  config.logger = ActiveSupport::Logger.new(STDOUT)
  end
end
