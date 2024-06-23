# typed: false
# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# frozen_string_literal: true

Rails.application.configure do
  config.cache_classes = false
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.public_file_server.enabled = true
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :cloudinary

  ## DEVISE SECTION

  # Configure the mailer to use the SMTP server provided by Office 365.
  config.action_mailer.smtp_settings = {
    address: 'smtp.office365.com',
    port: 587,
    domain: 'saintpaulsnaples.org',
    user_name: Rails.application.credentials.dig(:smtp, :username),
    password: Rails.application.credentials.dig(:smtp, :password),
    authentication: :login,
    enable_starttls_auto: true,
    openssl_verify_mode: 'none',
    open_timeout: 30,
    read_timeout: 30
  }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'www.saintpaulsnaples.org' }
  Rails.application.routes.default_url_options[:host] = 'www.saintpaulsnaples.org'

  # config.action_mailer.perform_caching = false
  # config.action_mailer.default_url_options = { host: 'localhost:3000' }
  # config.action_mailer.delivery_method = :letter_opener
  # config.action_mailer.perform_deliveries = true
  # config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true

  # config.sass.inline_source_maps = true

  ####
  Rails.application.config.default_url_options = { host: 'localhost', port: 3000 }
  Rails.application.default_url_options = { host: 'localhost', port: 3000 }
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise
  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  config.assets.digest = false
  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true
  config.log_level = :debug
  config.action_controller.action_on_unpermitted_parameters = :raise
  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.
  # disable_request_forgery_protection = true
end
