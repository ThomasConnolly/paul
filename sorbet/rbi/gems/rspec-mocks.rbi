# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rspec-mocks/all/rspec-mocks.rbi
#
# rspec-mocks-3.13.0

module RSpec
end
module RSpec::Mocks
end
class RSpec::Mocks::InstanceMethodStasher
end
class RSpec::Mocks::MethodDouble
end
class RSpec::Mocks::MethodDouble::RSpecPrependedModule < Module
end
module RSpec::Mocks::ArgumentMatchers
end
class RSpec::Mocks::ArgumentMatchers::SingletonMatcher
end
class RSpec::Mocks::ArgumentMatchers::AnyArgsMatcher < RSpec::Mocks::ArgumentMatchers::SingletonMatcher
end
class RSpec::Mocks::ArgumentMatchers::AnyArgMatcher < RSpec::Mocks::ArgumentMatchers::SingletonMatcher
end
class RSpec::Mocks::ArgumentMatchers::NoArgsMatcher < RSpec::Mocks::ArgumentMatchers::SingletonMatcher
end
class RSpec::Mocks::ArgumentMatchers::BooleanMatcher < RSpec::Mocks::ArgumentMatchers::SingletonMatcher
end
class RSpec::Mocks::ArgumentMatchers::BaseHashMatcher
end
class RSpec::Mocks::ArgumentMatchers::HashIncludingMatcher < RSpec::Mocks::ArgumentMatchers::BaseHashMatcher
end
class RSpec::Mocks::ArgumentMatchers::HashExcludingMatcher < RSpec::Mocks::ArgumentMatchers::BaseHashMatcher
end
class RSpec::Mocks::ArgumentMatchers::ArrayIncludingMatcher
end
class RSpec::Mocks::ArgumentMatchers::ArrayExcludingMatcher
end
class RSpec::Mocks::ArgumentMatchers::DuckTypeMatcher
end
class RSpec::Mocks::ArgumentMatchers::InstanceOf
end
class RSpec::Mocks::ArgumentMatchers::KindOf
end
class RSpec::Mocks::ObjectReference
end
class RSpec::Mocks::DirectObjectReference
end
class RSpec::Mocks::NamedObjectReference
end
module RSpec::Mocks::ExampleMethods
  include RSpec::Mocks::ArgumentMatchers
end
module RSpec::Mocks::ExampleMethods::ExpectHost
end
class RSpec::Mocks::Proxy
end
class RSpec::Mocks::TestDoubleProxy < RSpec::Mocks::Proxy
end
class RSpec::Mocks::PartialDoubleProxy < RSpec::Mocks::Proxy
end
module RSpec::Mocks::PartialClassDoubleProxyMethods
end
class RSpec::Mocks::PartialClassDoubleProxy < RSpec::Mocks::PartialDoubleProxy
  include RSpec::Mocks::PartialClassDoubleProxyMethods
end
class RSpec::Mocks::ProxyForNil < RSpec::Mocks::PartialDoubleProxy
end
module RSpec::Mocks::TestDouble
end
class RSpec::Mocks::Double
  include RSpec::Mocks::TestDouble
end
module RSpec::Mocks::TestDoubleFormatter
end
class RSpec::Mocks::ArgumentListMatcher
end
class RSpec::Mocks::SimpleMessageExpectation
end
class RSpec::Mocks::MessageExpectation
  include RSpec::Mocks::MessageExpectation::ImplementationDetails
end
module RSpec::Mocks::MessageExpectation::ImplementationDetails
end
class RSpec::Mocks::AndYieldImplementation
end
class RSpec::Mocks::AndReturnImplementation
end
class RSpec::Mocks::AndInvokeImplementation
end
class RSpec::Mocks::Implementation
end
class RSpec::Mocks::AndWrapOriginalImplementation
end
class RSpec::Mocks::AndWrapOriginalImplementation::CannotModifyFurtherError < StandardError
end
class RSpec::Mocks::OrderGroup
end
class RSpec::Mocks::MockExpectationError < Exception
end
class RSpec::Mocks::ExpiredTestDoubleError < RSpec::Mocks::MockExpectationError
end
class RSpec::Mocks::OutsideOfExampleError < StandardError
end
class RSpec::Mocks::MockExpectationAlreadyInvokedError < Exception
end
class RSpec::Mocks::CannotSupportArgMutationsError < StandardError
end
class RSpec::Mocks::UnsupportedMatcherError < StandardError
end
class RSpec::Mocks::NegationUnsupportedError < StandardError
end
class RSpec::Mocks::VerifyingDoubleNotDefinedError < StandardError
end
class RSpec::Mocks::ErrorGenerator
end
class RSpec::Mocks::RootSpace
end
class RSpec::Mocks::Space
end
class RSpec::Mocks::NestedSpace < RSpec::Mocks::Space
end
class RSpec::Mocks::Constant
  extend RSpec::Support::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator
  extend RSpec::Support::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator::BaseMutator
  include RSpec::Support::RecursiveConstMethods
end
class RSpec::Mocks::ConstantMutator::ConstantHider < RSpec::Mocks::ConstantMutator::BaseMutator
end
class RSpec::Mocks::ConstantMutator::DefinedConstantReplacer < RSpec::Mocks::ConstantMutator::BaseMutator
end
class RSpec::Mocks::ConstantMutator::UndefinedConstantSetter < RSpec::Mocks::ConstantMutator::BaseMutator
end
module RSpec::Mocks::TargetDelegationClassMethods
end
module RSpec::Mocks::TargetDelegationInstanceMethods
end
class RSpec::Mocks::TargetBase
  extend RSpec::Mocks::TargetDelegationClassMethods
  include RSpec::Mocks::TargetDelegationInstanceMethods
end
module RSpec::Mocks::ExpectationTargetMethods
  extend RSpec::Mocks::TargetDelegationClassMethods
  include RSpec::Mocks::TargetDelegationInstanceMethods
end
class RSpec::Mocks::ExpectationTarget < RSpec::Mocks::TargetBase
  include RSpec::Mocks::ExpectationTargetMethods
end
class RSpec::Mocks::AllowanceTarget < RSpec::Mocks::TargetBase
end
class RSpec::Mocks::AnyInstanceAllowanceTarget < RSpec::Mocks::TargetBase
end
class RSpec::Mocks::AnyInstanceExpectationTarget < RSpec::Mocks::TargetBase
end
module RSpec::Mocks::Syntax
end
class BasicObject
end
class Class < Module
end
class RSpec::Mocks::Configuration
end
class RSpec::Mocks::VerifyingMessageExpectation < RSpec::Mocks::MessageExpectation
end
class RSpec::Mocks::MethodReference
end
class RSpec::Mocks::InstanceMethodReference < RSpec::Mocks::MethodReference
end
class RSpec::Mocks::ObjectMethodReference < RSpec::Mocks::MethodReference
end
class RSpec::Mocks::ClassNewMethodReference < RSpec::Mocks::ObjectMethodReference
end
class RSpec::Mocks::CallbackInvocationStrategy
end
class RSpec::Mocks::NoCallbackInvocationStrategy
end
module RSpec::Mocks::VerifyingProxyMethods
end
class RSpec::Mocks::VerifyingProxy < RSpec::Mocks::TestDoubleProxy
  include RSpec::Mocks::VerifyingProxyMethods
end
class RSpec::Mocks::VerifyingPartialDoubleProxy < RSpec::Mocks::PartialDoubleProxy
  include RSpec::Mocks::VerifyingProxyMethods
end
class RSpec::Mocks::VerifyingPartialClassDoubleProxy < RSpec::Mocks::VerifyingPartialDoubleProxy
  include RSpec::Mocks::PartialClassDoubleProxyMethods
end
class RSpec::Mocks::VerifyingMethodDouble < RSpec::Mocks::MethodDouble
end
class RSpec::Mocks::VerifyingExistingMethodDouble < RSpec::Mocks::VerifyingMethodDouble
end
class RSpec::Mocks::VerifyingExistingClassNewMethodDouble < RSpec::Mocks::VerifyingExistingMethodDouble
end
module RSpec::Mocks::VerifyingDouble
end
class RSpec::Mocks::InstanceVerifyingDouble
  include RSpec::Mocks::TestDouble
  include RSpec::Mocks::VerifyingDouble
end
module RSpec::Mocks::ObjectVerifyingDoubleMethods
  include RSpec::Mocks::TestDouble
  include RSpec::Mocks::VerifyingDouble
end
class RSpec::Mocks::ObjectVerifyingDouble
  include RSpec::Mocks::ObjectVerifyingDoubleMethods
end
class RSpec::Mocks::ClassVerifyingDouble < Module
  include RSpec::Mocks::ObjectVerifyingDoubleMethods
end
module RSpec::Mocks::Version
end
module RSpec::Mocks::Matchers
end
module RSpec::Mocks::Matchers::Matcher
end
module RSpec::Mocks::AnyInstance
end
class RSpec::Mocks::AnyInstance::Chain
  include RSpec::Mocks::AnyInstance::Chain::Customizations
end
module RSpec::Mocks::AnyInstance::Chain::Customizations
end
class RSpec::Mocks::AnyInstance::ErrorGenerator < RSpec::Mocks::ErrorGenerator
end
class RSpec::Mocks::AnyInstance::StubChain < RSpec::Mocks::AnyInstance::Chain
end
class RSpec::Mocks::AnyInstance::StubChainChain < RSpec::Mocks::AnyInstance::StubChain
end
class RSpec::Mocks::AnyInstance::ExpectChainChain < RSpec::Mocks::AnyInstance::StubChain
end
class RSpec::Mocks::AnyInstance::ExpectationChain < RSpec::Mocks::AnyInstance::Chain
end
class RSpec::Mocks::AnyInstance::PositiveExpectationChain < RSpec::Mocks::AnyInstance::ExpectationChain
end
class RSpec::Mocks::AnyInstance::MessageChains
end
class RSpec::Mocks::AnyInstance::Recorder
end
class RSpec::Mocks::AnyInstance::Proxy
end
class RSpec::Mocks::AnyInstance::FluentInterfaceProxy < BasicObject
end
class RSpec::Mocks::MessageChain
end
class RSpec::Mocks::ExpectChain < RSpec::Mocks::MessageChain
end
class RSpec::Mocks::StubChain < RSpec::Mocks::MessageChain
end
class RSpec::Mocks::MarshalExtension
end
class RSpec::Mocks::Matchers::HaveReceived
  include RSpec::Mocks::Matchers::Matcher
end
class RSpec::Mocks::Matchers::ExpectationCustomization
end
class RSpec::Mocks::Matchers::Receive
  include RSpec::Mocks::Matchers::Matcher
end
class RSpec::Mocks::Matchers::Receive::DefaultDescribable
end
class RSpec::Mocks::Matchers::ReceiveMessageChain
  include RSpec::Mocks::Matchers::Matcher
end
class RSpec::Mocks::Matchers::ReceiveMessages
  include RSpec::Mocks::Matchers::Matcher
end
