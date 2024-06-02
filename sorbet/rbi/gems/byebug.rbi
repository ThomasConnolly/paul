# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/byebug/all/byebug.rbi
#
# byebug-11.1.3

module Byebug
  def self.attach; end
  def self.spawn(host = nil, port = nil); end
  extend Byebug
  include Byebug::Helpers::ReflectionHelper
end
module Kernel
  def byebug; end
  def debugger(pre: nil, do: nil, up_level: nil); end
  def remote_byebug(host = nil, port = nil); end
end
module Byebug::Helpers
end
module Byebug::Helpers::ReflectionHelper
end
module Byebug::Helpers::FileHelper
end
class Byebug::Frame
  include Byebug::Helpers::FileHelper
end
module Byebug::Helpers::PathHelper
end
module Byebug::Helpers::EvalHelper
end
class Byebug::CommandNotFound < NoMethodError
end
class Byebug::CommandProcessor
  extend Forwardable
  include Byebug::Helpers::EvalHelper
end
class Byebug::Context
  extend Forwardable
  include Byebug::Helpers::FileHelper
end
class Byebug::Breakpoint
end
module Byebug::Helpers::StringHelper
end
class Byebug::Setting
end
class Byebug::History
end
class Byebug::LocalInterface < Byebug::Interface
end
class Byebug::ScriptInterface < Byebug::Interface
end
class Byebug::RemoteInterface < Byebug::Interface
end
class Byebug::Interface
  include Byebug::Helpers::FileHelper
end
class Byebug::ScriptProcessor < Byebug::CommandProcessor
end
class Byebug::PostMortemProcessor < Byebug::CommandProcessor
end
class Byebug::Command
  extend Forwardable
end
module Byebug::Helpers::ParseHelper
end
class Byebug::SourceFileFormatter
  include Byebug::Helpers::FileHelper
end
class Byebug::BreakCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
  include Byebug::Helpers::FileHelper
  include Byebug::Helpers::ParseHelper
end
class Byebug::CatchCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
end
class Byebug::ConditionCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::ContinueCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::DebugCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
end
class Byebug::DeleteCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::CommandList
  include Enumerable
end
module Byebug::Subcommands
  extend Forwardable
end
module Byebug::Subcommands::ClassMethods
  include Byebug::Helpers::ReflectionHelper
end
module Byebug::Helpers::ToggleHelper
  include Byebug::Helpers::ParseHelper
end
class Byebug::DisableCommand < Byebug::Command
  extend Byebug::Subcommands::ClassMethods
  include Byebug::Subcommands
end
class Byebug::DisableCommand::BreakpointsCommand < Byebug::Command
  include Byebug::Helpers::ToggleHelper
end
class Byebug::DisableCommand::DisplayCommand < Byebug::Command
  include Byebug::Helpers::ToggleHelper
end
class Byebug::DisplayCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
end
module Byebug::Helpers::FrameHelper
end
class Byebug::DownCommand < Byebug::Command
  include Byebug::Helpers::FrameHelper
  include Byebug::Helpers::ParseHelper
end
class Byebug::EditCommand < Byebug::Command
end
class Byebug::EnableCommand < Byebug::Command
  extend Byebug::Subcommands::ClassMethods
  include Byebug::Subcommands
end
class Byebug::EnableCommand::BreakpointsCommand < Byebug::Command
  include Byebug::Helpers::ToggleHelper
end
class Byebug::EnableCommand::DisplayCommand < Byebug::Command
  include Byebug::Helpers::ToggleHelper
end
class Byebug::FinishCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::FrameCommand < Byebug::Command
  include Byebug::Helpers::FrameHelper
  include Byebug::Helpers::ParseHelper
end
class Byebug::HelpCommand < Byebug::Command
end
class Byebug::HistoryCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::InfoCommand < Byebug::Command
  extend Byebug::Subcommands::ClassMethods
  include Byebug::Subcommands
end
class Byebug::InfoCommand::BreakpointsCommand < Byebug::Command
end
class Byebug::InfoCommand::DisplayCommand < Byebug::Command
end
class Byebug::InfoCommand::FileCommand < Byebug::Command
  include Byebug::Helpers::FileHelper
  include Byebug::Helpers::StringHelper
end
class Byebug::InfoCommand::LineCommand < Byebug::Command
end
class Byebug::InfoCommand::ProgramCommand < Byebug::Command
end
class Byebug::InterruptCommand < Byebug::Command
end
class Byebug::IrbCommand < Byebug::Command
end
class Byebug::KillCommand < Byebug::Command
end
class Byebug::ListCommand < Byebug::Command
  extend Forwardable
  include Byebug::Helpers::FileHelper
  include Byebug::Helpers::ParseHelper
end
class Byebug::MethodCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
end
class Byebug::NextCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::PryCommand < Byebug::Command
end
class Byebug::QuitCommand < Byebug::Command
end
module Byebug::Helpers::BinHelper
end
class Byebug::RestartCommand < Byebug::Command
  include Byebug::Helpers::BinHelper
  include Byebug::Helpers::PathHelper
end
class Byebug::SaveCommand < Byebug::Command
end
class Byebug::SetCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::ShowCommand < Byebug::Command
end
class Byebug::SkipCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::SourceCommand < Byebug::Command
end
class Byebug::StepCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
module Byebug::Helpers::ThreadHelper
end
class Byebug::ThreadCommand < Byebug::Command
  extend Byebug::Subcommands::ClassMethods
  include Byebug::Subcommands
end
class Byebug::ThreadCommand::CurrentCommand < Byebug::Command
  include Byebug::Helpers::ThreadHelper
end
class Byebug::ThreadCommand::ListCommand < Byebug::Command
  include Byebug::Helpers::ThreadHelper
end
class Byebug::ThreadCommand::ResumeCommand < Byebug::Command
  include Byebug::Helpers::ThreadHelper
end
class Byebug::ThreadCommand::StopCommand < Byebug::Command
  include Byebug::Helpers::ThreadHelper
end
class Byebug::ThreadCommand::SwitchCommand < Byebug::Command
  include Byebug::Helpers::ThreadHelper
end
class Byebug::TracevarCommand < Byebug::Command
end
class Byebug::UndisplayCommand < Byebug::Command
  include Byebug::Helpers::ParseHelper
end
class Byebug::UntracevarCommand < Byebug::Command
end
class Byebug::UpCommand < Byebug::Command
  include Byebug::Helpers::FrameHelper
  include Byebug::Helpers::ParseHelper
end
module Byebug::Helpers::VarHelper
  include Byebug::Helpers::EvalHelper
end
class Byebug::VarCommand < Byebug::Command
  extend Byebug::Subcommands::ClassMethods
  include Byebug::Subcommands
end
class Byebug::VarCommand::AllCommand < Byebug::Command
  include Byebug::Helpers::VarHelper
end
class Byebug::VarCommand::ArgsCommand < Byebug::Command
  include Byebug::Helpers::VarHelper
end
class Byebug::VarCommand::ConstCommand < Byebug::Command
  include Byebug::Helpers::EvalHelper
end
class Byebug::VarCommand::InstanceCommand < Byebug::Command
  include Byebug::Helpers::VarHelper
end
class Byebug::VarCommand::LocalCommand < Byebug::Command
  include Byebug::Helpers::VarHelper
end
class Byebug::VarCommand::GlobalCommand < Byebug::Command
  include Byebug::Helpers::VarHelper
end
class Byebug::WhereCommand < Byebug::Command
  include Byebug::Helpers::FrameHelper
end
class Byebug::ControlProcessor < Byebug::CommandProcessor
end
module Byebug::Remote
end
class Byebug::Remote::Server
end
class Byebug::Remote::Client
end
module Byebug::Printers
end
class Byebug::Printers::Base
end
class Byebug::Printers::Base::MissedPath < StandardError
end
class Byebug::Printers::Base::MissedArgument < StandardError
end
class Byebug::Printers::Plain < Byebug::Printers::Base
end
class Byebug::AutoirbSetting < Byebug::Setting
end
class Byebug::AutolistSetting < Byebug::Setting
end
class Byebug::AutoprySetting < Byebug::Setting
end
class Byebug::AutosaveSetting < Byebug::Setting
end
class Byebug::BasenameSetting < Byebug::Setting
end
class Byebug::CallstyleSetting < Byebug::Setting
end
class Byebug::FullpathSetting < Byebug::Setting
end
class Byebug::HistfileSetting < Byebug::Setting
end
class Byebug::HistsizeSetting < Byebug::Setting
end
class Byebug::LinetraceSetting < Byebug::Setting
end
class Byebug::ListsizeSetting < Byebug::Setting
end
class Byebug::PostMortemSetting < Byebug::Setting
end
class Byebug::SavefileSetting < Byebug::Setting
end
class Byebug::StackOnErrorSetting < Byebug::Setting
end
class Byebug::WidthSetting < Byebug::Setting
end
class Exception
end
