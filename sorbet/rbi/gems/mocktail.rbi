# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/mocktail/all/mocktail.rbi
#
# mocktail-2.0.0

module Mocktail
  extend Mocktail::DSL
  extend T::Sig
end
class Mocktail::CollectsCalls
  extend T::Sig
end
module Mocktail::Debug
  extend T::Sig
end
module Mocktail::DSL
  extend T::Sig
end
class Mocktail::Error < StandardError
end
class Mocktail::UnexpectedError < Mocktail::Error
end
class Mocktail::UnsupportedMocktail < Mocktail::Error
end
class Mocktail::MissingDemonstrationError < Mocktail::Error
end
class Mocktail::AmbiguousDemonstrationError < Mocktail::Error
end
class Mocktail::InvalidMatcherError < Mocktail::Error
end
class Mocktail::VerificationError < Mocktail::Error
end
class Mocktail::TypeCheckingError < Mocktail::Error
end
class Mocktail::StringifiesMethodName
  extend T::Sig
end
class Mocktail::StringifiesCall
  extend T::Sig
end
class Mocktail::ExplainsThing
  extend T::Sig
end
class Mocktail::ExplainsNils
  extend T::Sig
end
class Mocktail::GrabsOriginalMethodParameters
  extend T::Sig
end
module Mocktail::Bind
end
class Mocktail::DeterminesMatchingCalls
  extend T::Sig
end
class Mocktail::FindsSatisfaction
  extend T::Sig
end
class Mocktail::CleansBacktrace
  extend T::Sig
end
class Mocktail::DescribesUnsatisfiedStubbing
  extend T::Sig
end
class Mocktail::FulfillsStubbing
  extend T::Sig
end
class Mocktail::LogsCall
  extend T::Sig
end
class Mocktail::ValidatesArguments
  extend T::Sig
end
class Mocktail::HandlesDryCall
  extend T::Sig
end
class Mocktail::HandlesDryNewCall
  extend T::Sig
end
class Mocktail::EnsuresImitationSupport
  extend T::Sig
end
class Mocktail::ReconstructsCall
  extend T::Sig
end
class Mocktail::DeclaresDryClass
  extend T::Sig
end
class Mocktail::GathersFakeableInstanceMethods
  extend T::Sig
end
class Mocktail::MakesDouble
  extend T::Sig
end
class Mocktail::ImitatesType
  extend T::Generic
  extend T::Sig
end
class Mocktail::InitializesMocktail
  extend T::Sig
end
class Mocktail::MatcherPresentation
  extend T::Sig
end
module Mocktail::Matchers
end
class Mocktail::Matchers::Base
  extend T::Helpers
  extend T::Sig
end
class Mocktail::Matchers::Any < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::Captor
  extend T::Sig
end
class Mocktail::Matchers::Captor::Capture < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::Includes < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::IncludesString < Mocktail::Matchers::Includes
  extend T::Sig
end
class Mocktail::Matchers::IncludesHash < Mocktail::Matchers::Includes
  extend T::Sig
end
class Mocktail::Matchers::IncludesKey < Mocktail::Matchers::Includes
  extend T::Sig
end
class Mocktail::Matchers::IsA < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::Matches < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::Not < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::Numeric < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::Matchers::That < Mocktail::Matchers::Base
  extend T::Sig
end
class Mocktail::CreatesIdentifier
  extend T::Sig
end
class Mocktail::RaisesNeatoNoMethodError
  extend T::Sig
end
class Mocktail::RegistersMatcher
  extend T::Sig
end
class Mocktail::RecordsDemonstration
  extend T::Sig
end
class Mocktail::RegistersStubbing
  extend T::Sig
end
class Mocktail::ReplacesNext
  extend T::Sig
end
class Mocktail::RedefinesNew
  extend T::Sig
end
class Mocktail::RedefinesSingletonMethods
  extend T::Sig
end
class Mocktail::RunsSorbetSigBlocksBeforeReplacement
  extend T::Sig
end
class Mocktail::ReplacesType
  extend T::Sig
end
class Mocktail::ResetsState
  extend T::Sig
end
class Mocktail::TransformsParams
  extend T::Sig
end
class Mocktail::ReconcilesArgsWithParams
  extend T::Sig
end
class Mocktail::RecreatesMessage
  extend T::Sig
end
class Mocktail::SimulatesArgumentError
  extend T::Sig
end
class Mocktail::StringifiesMethodSignature
  extend T::Sig
end
class Mocktail::Cabinet
  extend T::Sig
end
class Mocktail::Call < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
end
class Mocktail::DemoConfig < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
class Mocktail::Explanation
  extend T::Sig
end
class Mocktail::NoExplanation < Mocktail::Explanation
end
class Mocktail::DoubleExplanation < Mocktail::Explanation
end
class Mocktail::ReplacedTypeExplanation < Mocktail::Explanation
end
class Mocktail::FakeMethodExplanation < Mocktail::Explanation
end
module Mocktail::ExplanationData
  extend T::Helpers
  extend T::Sig
  include Kernel
end
class Mocktail::Double < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
class Mocktail::Stubbing < T::Struct
  extend T::Generic
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
end
class Mocktail::DoubleData < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  include Mocktail::ExplanationData
end
class Mocktail::FakeMethodData < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  include Mocktail::ExplanationData
end
class Mocktail::MatcherRegistry
  extend T::Sig
end
class Mocktail::NoExplanationData < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
  include Mocktail::ExplanationData
end
class Mocktail::Params < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
end
class Mocktail::Signature < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
class Mocktail::TypeReplacement < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
class Mocktail::TypeReplacementData < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
  extend T::Sig
  include Mocktail::ExplanationData
end
class Mocktail::UnsatisfyingCallExplanation
  extend T::Sig
end
class Mocktail::UnsatisfyingCall < T::Struct
  extend T::Props::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Plugin::ClassMethods
  extend T::Props::Serializable::ClassMethods
end
class Mocktail::TopShelf
  extend T::Sig
end
class Mocktail::FindsVerifiableCalls
  extend T::Sig
end
class Mocktail::GathersCallsOfMethod
  extend T::Sig
end
class Mocktail::RaisesVerificationError
  extend T::Sig
end
class Mocktail::VerifiesCall
  extend T::Sig
end
