# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/logger/all/logger.rbi
#
# logger-1.6.0

class Logger
  def <<(msg); end
  def add(severity, message = nil, progname = nil); end
  def close; end
  def datetime_format; end
  def datetime_format=(datetime_format); end
  def debug!; end
  def debug(progname = nil, &block); end
  def debug?; end
  def error!; end
  def error(progname = nil, &block); end
  def error?; end
  def fatal!; end
  def fatal(progname = nil, &block); end
  def fatal?; end
  def format_message(severity, datetime, progname, msg); end
  def format_severity(severity); end
  def formatter; end
  def formatter=(arg0); end
  def info!; end
  def info(progname = nil, &block); end
  def info?; end
  def initialize(logdev, shift_age = nil, shift_size = nil, level: nil, progname: nil, formatter: nil, datetime_format: nil, binmode: nil, shift_period_suffix: nil); end
  def level; end
  def level=(severity); end
  def log(severity, message = nil, progname = nil); end
  def progname; end
  def progname=(arg0); end
  def reopen(logdev = nil); end
  def sev_threshold; end
  def sev_threshold=(severity); end
  def unknown(progname = nil, &block); end
  def warn!; end
  def warn(progname = nil, &block); end
  def warn?; end
  def with_level(severity); end
  include Logger::Severity
end
class Logger::Formatter
  def call(severity, time, progname, msg); end
  def datetime_format; end
  def datetime_format=(arg0); end
  def format_datetime(time); end
  def initialize; end
  def msg2str(msg); end
end
module Logger::Period
  def next_rotate_time(now, shift_age); end
  def previous_period_end(now, shift_age); end
  def self.next_rotate_time(now, shift_age); end
  def self.previous_period_end(now, shift_age); end
end
class Logger::LogDevice
  def add_log_header(file); end
  def check_shift_log; end
  def close; end
  def create_logfile(filename); end
  def dev; end
  def filename; end
  def initialize(log = nil, shift_age: nil, shift_size: nil, shift_period_suffix: nil, binmode: nil); end
  def lock_shift_log; end
  def open_logfile(filename); end
  def reopen(log = nil); end
  def set_dev(log); end
  def shift_log_age; end
  def shift_log_period(period_end); end
  def write(message); end
  include Logger::Period
  include MonitorMixin
end
module Logger::Severity
  def self.coerce(severity); end
end
class Logger::Error < RuntimeError
end
class Logger::ShiftingError < Logger::Error
end
