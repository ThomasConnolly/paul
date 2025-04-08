rb
# frozen_string_literal: true

Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.read_ahead = 10
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.raise_signal_exceptions = :term

# Configure logging based on environment
if Rails.env.production? && ENV['DYNO'].present?
  # Use STDOUT for Heroku
  Delayed::Worker.logger = Logger.new(STDOUT)
else
  # Ensure log directory exists in other environments
  log_dir = Rails.root.join('log')
  FileUtils.mkdir_p(log_dir) unless File.directory?(log_dir)
  Delayed::Worker.logger = Logger.new(Rails.root.join('log/delayed_job.log').to_s)
end