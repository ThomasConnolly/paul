require File.expand_path('../boot', __FILE__)


require 'csv'
require 'date'
require 'time'
require 'rails/all'
require 'attachinary/orm/active_record'



#  require 'awesome_print'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Paul
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over these.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded. 

config.time_zone = 'Eastern Time (US & Canada)'    
config.active_record.default_timezone = :local
end

config.assets.precompile += Ckeditor.assets
config.assets.precompile += %w( ckeditor/* )
config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

ActionMailer::Base.delivery_method = :smtp

module RailsBootstrap

  class Application < Rails::Application
    
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.fixture_replacement :factory_girl, dir: "spec/factories"
      end
    end
  end
end
