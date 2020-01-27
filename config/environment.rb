# frozen_string_literal: true

# Load the Rails application.
 require_relative 'application'

# Initialize the Rails application.
 #Rails.application.initialize!
# Paul::Application.initialize!

# Rails.logger = Logger.new(STDOUT)
# Rails.logger.level = Logger::DEBUG
# Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

require File.expand_path('../application', __FILE__)
require File.expand_path('../rollbar', __FILE__)

notify = ->(e) do
  begin
    Rollbar.with_config(use_async: false) do
      Rollbar.error(e)
    end
  rescue
    Rails.logger.error "Synchronous Rollbar notification failed.  Sending async to preserve info"
    Rollbar.error(e)
  end
end

begin
  Rails.application.initialize!
rescue Exception => e
  notify.(e)
  raise
end

 ActionMailer::Base.smtp_settings = {
  user_name: 'app36011847@heroku.com',
  password: Rails.application.credentials.sendgrid[:password],
  domain: 'saintpaulsnaples.org',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true
}
