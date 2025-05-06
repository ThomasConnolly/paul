if Rails.env.production?
  Rails.logger = ActiveSupport::TaggedLogging.new(
  ActiveSupport::Logger.new($stdout).tap { |logger| logger.formatter = Logger::Formatter.new }
 )
  ActionMailer::Base.logger = Rails.logger
end