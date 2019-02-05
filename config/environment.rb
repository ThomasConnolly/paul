# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# original_formatter = Logger::Formatter.new
# Rails Starting process with command `bundle exec puma -C config/puma.rb` 2019-02-05T01:42:57.563241+00:00 app[web.1]: ! Unable to load application: ArgumentError: Before process_action callback :verify_authenticity_token has not b Starting process with command `bundle exec puma -C config/puma.rb` 2019-02-05T01:42:57.563241+00:00 app[web.1]: ! Unable to load application: ArgumentError: Before process_action callback :verify_authenticity_token has not been defined 2019-02-05T01:42:57.563378+00:00 app[web.1]: een defined 2019-02-05T01:42:57.563378+00:00 app[web.1]:  Starting process with command `bundle exec puma -C config/puma.rb` 2019-02-05T01:42:57.563241+00:00 app[web.1]: ! Unable to load application: ArgumentError: Before process_action callback :verify_authenticity_token has not been defined 2019-02-05T01:42:57.563378+00:00 app[web.1]: .logger.formatter = proc { |severity, datetime, progname, msg|
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
