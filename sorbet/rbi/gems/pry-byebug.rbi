# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/pry-byebug/all/pry-byebug.rbi
#
# pry-byebug-3.10.1

module PryByebug
end
module PryByebug::Helpers
end
module PryByebug::Helpers::Location
end
module Byebug
end
class Byebug::PryProcessor < Byebug::CommandProcessor
  extend Forwardable
end
module PryByebug::Helpers::Navigation
end
class PryByebug::BacktraceCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
module PryByebug::Helpers::Multiline
end
class PryByebug::NextCommand < Pry::ClassCommand
  include PryByebug::Helpers::Multiline
  include PryByebug::Helpers::Navigation
end
class PryByebug::StepCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
module PryByebug::Helpers::Breakpoints
end
class PryByebug::ContinueCommand < Pry::ClassCommand
  include PryByebug::Helpers::Breakpoints
  include PryByebug::Helpers::Location
  include PryByebug::Helpers::Navigation
end
class PryByebug::FinishCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
class PryByebug::UpCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
class PryByebug::DownCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
class PryByebug::FrameCommand < Pry::ClassCommand
  include PryByebug::Helpers::Navigation
end
class Pry
end
module Pry::Byebug
end
module Pry::Byebug::Breakpoints
  extend Enumerable
  extend Pry::Byebug::Breakpoints
end
class Pry::Byebug::Breakpoints::FileBreakpoint < SimpleDelegator
end
class Pry::Byebug::Breakpoints::MethodBreakpoint < SimpleDelegator
end
class PryByebug::BreakCommand < Pry::ClassCommand
  include PryByebug::Helpers::Breakpoints
  include PryByebug::Helpers::Location
  include PryByebug::Helpers::Multiline
end
class PryByebug::ExitAllCommand < Pry::Command::ExitAll
end
