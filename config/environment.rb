# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: 'app36011847@heroku.com',
  password: Rails.application.credentials.sendgrid[:password],
  domain: 'saintpaulsnaples.org',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: 'plain',
  enable_starttls_auto: true
}
