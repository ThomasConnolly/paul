# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rspec-expectations/all/rspec-expectations.rbi
#
# rspec-expectations-3.13.0

module RSpec
end
module RSpec::Matchers
  extend RSpec::Matchers::DSL
end
module RSpec::Matchers::EnglishPhrasing
end
module RSpec::Matchers::Composable
end
module RSpec::Matchers::BuiltIn
end
class RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::BaseMatcher::DefaultFailureMessages
  include RSpec::Matchers::BuiltIn::BaseMatcher::HashFormatting
  include RSpec::Matchers::BuiltIn::BaseMatcher::StringEncodingFormatting
  include RSpec::Matchers::Composable
end
module RSpec::Matchers::BuiltIn::BaseMatcher::HashFormatting
end
module RSpec::Matchers::BuiltIn::BaseMatcher::StringEncodingFormatting
end
module RSpec::Matchers::BuiltIn::BaseMatcher::DefaultFailureMessages
end
module RSpec::Matchers::DSL
end
module RSpec::Matchers::DSL::Macros
end
module RSpec::Matchers::DSL::Macros::Deprecated
end
module RSpec::Matchers::DSL::DefaultImplementations
  include RSpec::Matchers::BuiltIn::BaseMatcher::DefaultFailureMessages
end
class RSpec::Matchers::DSL::Matcher
  extend RSpec::Matchers::DSL::Macros
  extend RSpec::Matchers::DSL::Macros::Deprecated
  include RSpec::Matchers
  include RSpec::Matchers::Composable
  include RSpec::Matchers::DSL::DefaultImplementations
end
class RSpec::Matchers::BaseDelegator
end
class RSpec::Matchers::MatcherDelegator < RSpec::Matchers::BaseDelegator
  include RSpec::Matchers::Composable
end
class RSpec::Matchers::AliasedMatcher < RSpec::Matchers::MatcherDelegator
end
class RSpec::Matchers::AliasedMatcherWithOperatorSupport < RSpec::Matchers::AliasedMatcher
end
class RSpec::Matchers::AliasedNegatedMatcher < RSpec::Matchers::AliasedMatcher
end
class RSpec::Matchers::MultiMatcherDiff
end
module RSpec::Expectations
end
class RSpec::Expectations::ExpectationTarget
  include RSpec::Expectations::ExpectationTarget::InstanceMethods
end
module RSpec::Expectations::ExpectationTarget::UndefinedValue
end
module RSpec::Expectations::ExpectationTarget::InstanceMethods
end
class RSpec::Expectations::ValueExpectationTarget < RSpec::Expectations::ExpectationTarget
end
class RSpec::Expectations::BlockExpectationTarget < RSpec::Expectations::ExpectationTarget
end
module RSpec::Expectations::Syntax
end
class BasicObject
end
class RSpec::Expectations::Configuration
end
module RSpec::Expectations::Configuration::NullBacktraceFormatter
end
class InvalidName___Class_0x00___Differ_115
end
module RSpec::Expectations::ExpectationHelper
end
class RSpec::Expectations::PositiveExpectationHandler
end
class RSpec::Expectations::NegativeExpectationHandler
end
class RSpec::Expectations::LegacyMatcherAdapter < RSpec::Matchers::MatcherDelegator
end
class RSpec::Expectations::LegacyMatcherAdapter::RSpec2 < RSpec::Expectations::LegacyMatcherAdapter
end
class RSpec::Expectations::LegacyMatcherAdapter::RSpec1 < RSpec::Expectations::LegacyMatcherAdapter
end
module RSpec::Expectations::Version
end
class RSpec::Expectations::ExpectationNotMetError < Exception
end
class RSpec::Expectations::MultipleExpectationsNotMetError < RSpec::Expectations::ExpectationNotMetError
end
class RSpec::Expectations::BlockSnippetExtractor
end
class RSpec::Expectations::BlockSnippetExtractor::Error < StandardError
end
class RSpec::Expectations::BlockSnippetExtractor::TargetNotFoundError < RSpec::Expectations::BlockSnippetExtractor::Error
end
class RSpec::Expectations::BlockSnippetExtractor::AmbiguousTargetError < RSpec::Expectations::BlockSnippetExtractor::Error
end
class RSpec::Expectations::FailureAggregator
end
class RSpec::Expectations::FailureAggregator::AggregatedFailure
end
class RSpec::Matchers::BuiltIn::BeAKindOf < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::BeAnInstanceOf < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::BeBetween < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::BeTruthy < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::BeFalsey < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::BeNil < RSpec::Matchers::BuiltIn::BaseMatcher
end
module RSpec::Matchers::BuiltIn::BeHelpers
end
class RSpec::Matchers::BuiltIn::Be < RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::BeHelpers
end
class RSpec::Matchers::BuiltIn::BeComparedTo < RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::BeHelpers
end
class RSpec::Matchers::BuiltIn::DynamicPredicate < RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::BeHelpers
end
class RSpec::Matchers::BuiltIn::Has < RSpec::Matchers::BuiltIn::DynamicPredicate
end
class RSpec::Matchers::BuiltIn::BePredicate < RSpec::Matchers::BuiltIn::DynamicPredicate
end
class RSpec::Matchers::BuiltIn::BeWithin < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Change < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::ChangeRelatively < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::SpecificValuesChange < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::ChangeFromValue < RSpec::Matchers::BuiltIn::SpecificValuesChange
end
class RSpec::Matchers::BuiltIn::ChangeToValue < RSpec::Matchers::BuiltIn::SpecificValuesChange
end
class RSpec::Matchers::BuiltIn::ChangeDetails
end
module RSpec::Matchers::BuiltIn::ChangeDetails::UNDEFINED
end
class RSpec::Matchers::BuiltIn::Compound < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Compound::SequentialEvaluator
end
class RSpec::Matchers::BuiltIn::Compound::NestedEvaluator
end
class RSpec::Matchers::BuiltIn::Compound::And < RSpec::Matchers::BuiltIn::Compound
end
class RSpec::Matchers::BuiltIn::Compound::Or < RSpec::Matchers::BuiltIn::Compound
end
class RSpec::Matchers::BuiltIn::ContainExactly < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::ContainExactly::PairingsMaximizer
end
class RSpec::Matchers::BuiltIn::ContainExactly::PairingsMaximizer::NullSolution
end
class RSpec::Matchers::BuiltIn::Cover < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::StartOrEndWith < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::StartWith < RSpec::Matchers::BuiltIn::StartOrEndWith
end
class RSpec::Matchers::BuiltIn::EndWith < RSpec::Matchers::BuiltIn::StartOrEndWith
end
class RSpec::Matchers::BuiltIn::Eq < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Eql < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Equal < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Exist < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Exist::ExistenceTest < Anonymous_Struct_116
end
class RSpec::Matchers::BuiltIn::HaveAttributes < RSpec::Matchers::BuiltIn::BaseMatcher
end
module RSpec::Matchers::BuiltIn::CountExpectation
end
class RSpec::Matchers::BuiltIn::Include < RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::CountExpectation
end
class RSpec::Matchers::BuiltIn::All < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::Match < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::ReliableMatchData
end
class RSpec::Matchers::BuiltIn::OperatorMatcher
end
class RSpec::Matchers::BuiltIn::PositiveOperatorMatcher < RSpec::Matchers::BuiltIn::OperatorMatcher
end
class RSpec::Matchers::BuiltIn::NegativeOperatorMatcher < RSpec::Matchers::BuiltIn::OperatorMatcher
end
class RSpec::Matchers::BuiltIn::Output < RSpec::Matchers::BuiltIn::BaseMatcher
end
module RSpec::Matchers::BuiltIn::NullCapture
end
module RSpec::Matchers::BuiltIn::CaptureStdout
end
module RSpec::Matchers::BuiltIn::CaptureStderr
end
class RSpec::Matchers::BuiltIn::CaptureStreamToTempfile < Anonymous_Struct_117
end
class RSpec::Matchers::BuiltIn::RaiseError
  include RSpec::Matchers::Composable
end
class RSpec::Matchers::BuiltIn::RespondTo < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::RespondTo::ArityCheck
end
class RSpec::Matchers::BuiltIn::Satisfy < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::ThrowSymbol
  include RSpec::Matchers::Composable
end
class RSpec::Matchers::BuiltIn::YieldProbe
end
class RSpec::Matchers::BuiltIn::YieldControl < RSpec::Matchers::BuiltIn::BaseMatcher
  include RSpec::Matchers::BuiltIn::CountExpectation
end
class RSpec::Matchers::BuiltIn::YieldWithNoArgs < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::YieldWithArgs < RSpec::Matchers::BuiltIn::BaseMatcher
end
class RSpec::Matchers::BuiltIn::YieldSuccessiveArgs < RSpec::Matchers::BuiltIn::BaseMatcher
end
