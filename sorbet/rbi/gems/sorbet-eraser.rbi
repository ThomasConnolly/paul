# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/sorbet-eraser/all/sorbet-eraser.rbi
#
# sorbet-eraser-0.3.1

module T
end
class T::Enum
end
module T::Props
end
module T::Props::ClassMethods
end
module T::Props::Serializable
end
module T::Props::Constructor
end
class T::InexactStruct
  extend T::Props::ClassMethods
  extend T::Props::ClassMethods
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  include T::Props
  include T::Props::Constructor
  include T::Props::Serializable
end
class T::Struct < T::InexactStruct
end
class T::ImmutableStruct < T::InexactStruct
end
module T::Helpers
end
module T::Generic
  include T::Helpers
end
module T::Sig
end
module T::Private
end
module T::Private::RuntimeLevels
end
module T::Private::Methods
end
module T::Private::Methods::MethodHooks
end
module T::Private::Methods::SingletonMethodHooks
end
module T::Configuration
end