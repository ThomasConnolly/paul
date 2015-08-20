# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# config.action_mailer.default_url_options = { host: 'saintpauls.herokuapp.com'}
# config.action_mailer.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
    addresses: 'smtp.sendgrid.net',
    port:      '587',
    domain:    'heroku.com',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password:  ENV['SENDGRID_PASSWORD'],
    enable_starttls_auto: true  
  }
