# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available in ENV["RAILS_MASTER_KEY"], config/master.key, or an environment
  # key such as config/credentials/production.key. This key is used to decrypt credentials (and other encrypted files).
  config.require_master_key = false

  # Disable serving static files from `public/`, relying on NGINX/Apache to do so instead.

  # Propshaft production settings
  config.assets.compile = false
  config.public_file_server.enabled = true
  config.assets.digest = true

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.asset_host = "http://assets.example.com"

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for Apache
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # for NGINX

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :cloudinary

  # Override ActiveStorage service during asset precompilation to avoid API calls
  if defined?(Rake) && Rake.const_defined?(:Application) &&
     Rake.application && Rake.application.top_level_tasks &&
     Rake.application.top_level_tasks.include?('assets:precompile')
    config.active_storage.service = :local
  end

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = true

  logger = ActiveSupport::Logger.new($stdout)
  logger.formatter = Logger::Formatter.new
  config.logger = ActiveSupport::TaggedLogging.new(logger)

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # "info" includes generic and useful information about system operation, but avoids logging too much
  # information to avoid inadvertent exposure of personally identifiable information (PII). If you
  # want to log everything, set the level to "debug".
  config.log_level = :debug

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment).
  config.active_job.queue_adapter = :delayed_job

  # config.active_job.queue_name_prefix = "paul_production"

  # Disable caching for Action Mailer templates even if Action Controller
  # caching is enabled.

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.logger = ActiveSupport::Logger.new($stdout)
  config.action_mailer.logger.level = Logger::DEBUG
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'saintpauls.herokuapp.com',
                                               protocol: 'https' }
  # Rails.application.routes.default_url_options[:host] =
  # 'www.saintpaulsnaples.org'

  # Configure the mailer to use gmail SMTP.

  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'saintpauls.herokuapp.com',
    user_name: ENV.fetch('SMTP_USERNAME', nil),
    password: ENV.fetch('SMTP_PASSWORD', nil),
    authentication: :plain,
    enable_starttls_auto: true
  }

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = true

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # Enable DNS rebinding protection and other `Host` header attacks.
  # config.hosts = [
  #   "example.com",     # Allow requests from example.com
  #   /.*\.example\.com/ # Allow requests from subdomains like `www.example.com`
  # ]
  # Skip DNS rebinding protection for the default health check endpoint.
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # Allow your domains for Rails 8 host authorization
  config.hosts << 'saintpauls.herokuapp.com'
  config.hosts << 'saintpaulsnaples.org'
  config.hosts << 'www.saintpaulsnaples.org'
end
