# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/method_source/all/method_source.rbi
#
# method_source-1.1.0

module MethodSource
  extend MethodSource::CodeHelpers
end
module MethodSource::ReeSourceLocation
end
module MethodSource::SourceLocation
end
module MethodSource::SourceLocation::MethodExtensions
end
module MethodSource::SourceLocation::ProcExtensions
end
module MethodSource::SourceLocation::UnboundMethodExtensions
end
module MethodSource::CodeHelpers
end
module MethodSource::CodeHelpers::IncompleteExpression
end
class MethodSource::SourceNotFoundError < StandardError
end
module MethodSource::MethodExtensions
end
class Method
  include MethodSource::MethodExtensions
  include MethodSource::SourceLocation::MethodExtensions
end
class UnboundMethod
  include MethodSource::MethodExtensions
  include MethodSource::SourceLocation::UnboundMethodExtensions
end
class Proc
  include MethodSource::MethodExtensions
  include MethodSource::SourceLocation::ProcExtensions
end
