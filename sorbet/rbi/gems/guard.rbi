# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/guard/all/guard.rbi
#
# guard-2.18.1

module Guard
  extend Guard::Deprecated::Guard::ClassMethods
end
class Anonymous_Nenv_Environment_97 < Nenv::Environment
end
class Guard::Config < Anonymous_Nenv_Environment_97
end
module Guard::UI
  include Guard::UI::Colors
end
module Guard::UI::Colors
end
class Guard::Options < Thor::CoreExt::HashWithIndifferentAccess
end
class Guard::UI::Logger
end
class Guard::UI::Logger::Config < Guard::Options
end
class Guard::UI::Config < Guard::Options
end
class Guard::Terminal
end
class Guard::PluginUtil
end
class Guard::Group
end
module Guard::Internals
end
class Guard::Internals::Groups
end
class Guard::Plugin
end
class Guard::Internals::Plugins
end
class Guard::Internals::Session
end
class Guard::Internals::Scope
end
module Guard::Deprecated
end
module Guard::Deprecated::Watcher
end
module Guard::Deprecated::Watcher::ClassMethods
end
class Guard::Watcher
  extend Guard::Deprecated::Watcher::ClassMethods
end
class Guard::Watcher::Pattern
end
class Guard::Watcher::Pattern::MatchResult
end
class Guard::Watcher::Pattern::Matcher
end
class Guard::Watcher::Pattern::DeprecatedRegexp
end
class Guard::Watcher::Pattern::SimplePath
end
class Guard::Watcher::Pattern::PathnamePath < Guard::Watcher::Pattern::SimplePath
end
class Guard::Runner
end
class Guard::Internals::State
end
module Guard::Deprecated::Evaluator
end
class Guard::Interactor
  extend Forwardable
end
class Guard::Notifier
end
module Guard::Deprecated::Dsl
end
module Guard::Deprecated::Dsl::ClassMethods
end
class Guard::Dsl
  extend Guard::Deprecated::Dsl::ClassMethods
end
class Guard::Dsl::Error < RuntimeError
end
class Guard::DslReader < Guard::Dsl
end
module Guard::Guardfile
end
class Guard::Guardfile::Evaluator
  include Guard::Deprecated::Evaluator
end
class Guard::Guardfile::Evaluator::Error < RuntimeError
end
class Guard::Guardfile::Evaluator::NoGuardfileError < Guard::Guardfile::Evaluator::Error
end
class Guard::Guardfile::Evaluator::NoCustomGuardfile < Guard::Guardfile::Evaluator::Error
end
class Guard::Guardfile::Evaluator::NoPluginsError < Guard::Guardfile::Evaluator::Error
end
module Guard::Deprecated::Guard
end
module Guard::Deprecated::Guard::ClassMethods
end
module Guard::Internals::Helpers
end
module Guard::Internals::Tracing
end
class Guard::Internals::Debugging
end
module Guard::Internals::Traps
end
class Guard::Internals::Queue
end