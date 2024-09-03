# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/yard-sorbet/all/yard-sorbet.rbi
#
# yard-sorbet-0.9.0

module YARDSorbet
end
module YARDSorbet::Directives
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module YARDSorbet::Handlers
end
class YARDSorbet::Handlers::AbstractDSLHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class YARDSorbet::Handlers::EnumsHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class YARDSorbet::Handlers::IncludeHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class YARDSorbet::Handlers::MixesInClassMethodsHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class YARDSorbet::Handlers::SigHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module YARDSorbet::Handlers::StructClassHandler
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
class YARD::Handlers::Ruby::ClassHandler < YARD::Handlers::Ruby::Base
  include YARDSorbet::Handlers::StructClassHandler
end
class YARDSorbet::Handlers::StructPropHandler < YARD::Handlers::Ruby::Base
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module YARDSorbet::NodeUtils
  extend T::Private::Methods::MethodHooks
  extend T::Private::Methods::SingletonMethodHooks
  extend T::Sig
end
module YARDSorbet::SigToYARD
end
class YARDSorbet::TStructProp < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end