# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', nil) # Uses the DSN from Heroku
  config.environment = Rails.env # Tracks errors differently in dev vs. prod
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.send_default_pii = true # Capture user data if needed
end
