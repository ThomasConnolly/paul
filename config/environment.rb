# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# original_formatter = Logger::Formatter.new
# Rails.logger.formatter = proc { |severity, datetime, progname, msg|
#   original_formatter.call(severity, datetime, progname, msg.dump)
# }

Rails.logger.debug("Logger created")
Rails.logger.info("Program started")
Rails.logger.warn("Nothing to do")

begin
rescue => error
  Rails.logger.fatal("Caught exception; exiting")
  Rails.logger.fatal(err)
end

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port:            '587',
  authentication: 'plain',
  user_name:       ENV['SENDGRID_USERNAME'],
  password:        ENV['SENDGRID_PASSWORD'],
  domain:         'saintpaulsnaples.org',
  enable_starttls_auto: true}
