# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/spoom/all/spoom.rbi
#
# spoom-1.3.1

module Spoom
  extend T::Sig
end
class Spoom::FileCollector
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Spoom::Context
end
module Spoom::Context::Bundle
  extend T::Helpers
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class Spoom::ExecResult < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
end
class Spoom::Error < StandardError
end
