require_relative 'boot'
require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'rails/test_unit/railtie'
require 'csv'


  # Require the gems listed in Gemfile, including any gems
  # you've limited to :test, :development, or :production.
  Bundler.require(*Rails.groups)

  module Paul
    class Application < Rails::Application
      # Initialize configuration defaults originally generated Rails version.
      config.load_defaults 6.1

      config.beginning_of_week = :sunday
      config.time_zone = 'Eastern Time (US & Canada)'
      config.generators do |g|
        g.stylesheets false
      end

      # Settings in config/environments/* take precedence over these.
      # Application configuration can go into files in config/initializers
      # -- all .rb files in that directory are automatically loaded after loading
      # the framework and any gems in your application.
    end
  end

  module ActionDispatch
    class Cookies
      class CookieJar #:nodoc:
        def handle_options(options) #:nodoc:
          # Monkey patch to work on Chrome 80 inside iframes again
          if request.ssl? && request.user_agent&.include?('Chrome/8')
            options[:same_site] ||= "None";options[:secure] = true
          end

          if options[:expires].respond_to?(:from_now)
            options[:expires] = options[:expires].from_now
          end

          options[:path] ||= "/"

          if options[:domain] == :all || options[:domain] == "all"
            # If there is a provided tld length then we use it otherwise default domain regexp.
            domain_regexp = options[:tld_length] ? /([^.]+\.?){#{options[:tld_length]}}$/ : DOMAIN_REGEXP

            # If host is not ip and matches domain regexp.
            # (ip confirms to domain regexp so we explicitly check for ip)
            options[:domain] = if (request.host !~ /^[\d.]+$/) && (request.host =~ domain_regexp)
              ".#{$&}"
            
          elsif options[:domain].is_a? Array
            # If host matches one of the supplied domains without a dot in front of it.
            options[:domain] = options[:domain].find { |domain| request.host.include? domain.sub(/^\./, "") }
          end
        end
      end
    end
  end
end
