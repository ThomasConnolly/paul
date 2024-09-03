# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rubocop-ast/all/rubocop-ast.rbi
#
# rubocop-ast-1.32.0

module RuboCop
end
module RuboCop::AST
  extend RuboCop::AST::RuboCopCompatibility
end
module RuboCop::AST::Ext
end
module RuboCop::AST::Ext::Range
end
class Parser::Source::Range
  include RuboCop::AST::Ext::Range
end
class RuboCop::AST::NodePattern
  extend Forwardable
  include RuboCop::AST::NodePattern::MethodDefiner
end
module RuboCop::AST::NodePattern::MethodDefiner
end
module RuboCop::AST::NodePattern::Macros
end
class RuboCop::AST::NodePattern::Invalid < StandardError
end
module RuboCop::AST::Descendence
end
class RuboCop::AST::NodePattern::Builder
end
class RuboCop::AST::NodePattern::Comment
end
class RuboCop::AST::NodePattern::Compiler
  extend Forwardable
end
class RuboCop::AST::NodePattern::Compiler::Subcompiler
end
class RuboCop::AST::NodePattern::Compiler::AtomSubcompiler < RuboCop::AST::NodePattern::Compiler::Subcompiler
end
class RuboCop::AST::NodePattern::Compiler::Binding
end
class RuboCop::AST::NodePattern::Compiler::NodePatternSubcompiler < RuboCop::AST::NodePattern::Compiler::Subcompiler
end
class RuboCop::AST::NodePattern::Compiler::SequenceSubcompiler < RuboCop::AST::NodePattern::Compiler::Subcompiler
end
class RuboCop::AST::NodePattern::LexerRex
end
class RuboCop::AST::NodePattern::LexerRex::LexerError < StandardError
end
class RuboCop::AST::NodePattern::LexerRex::ScanError < RuboCop::AST::NodePattern::LexerRex::LexerError
end
class RuboCop::AST::NodePattern::Lexer < RuboCop::AST::NodePattern::LexerRex
end
class RuboCop::AST::NodePattern::Node < Parser::AST::Node
  extend Forwardable
  include RuboCop::AST::Descendence
end
module RuboCop::AST::NodePattern::Node::ForbidInSeqHead
end
class RuboCop::AST::NodePattern::Node::Capture < RuboCop::AST::NodePattern::Node
end
class RuboCop::AST::NodePattern::Node::Sequence < RuboCop::AST::NodePattern::Node
  include RuboCop::AST::NodePattern::Node::ForbidInSeqHead
end
class RuboCop::AST::NodePattern::Node::Predicate < RuboCop::AST::NodePattern::Node
end
class RuboCop::AST::NodePattern::Node::Repetition < RuboCop::AST::NodePattern::Node
  include RuboCop::AST::NodePattern::Node::ForbidInSeqHead
end
class RuboCop::AST::NodePattern::Node::Rest < RuboCop::AST::NodePattern::Node
end
class RuboCop::AST::NodePattern::Node::AnyOrder < RuboCop::AST::NodePattern::Node
  include RuboCop::AST::NodePattern::Node::ForbidInSeqHead
end
class RuboCop::AST::NodePattern::Node::Subsequence < RuboCop::AST::NodePattern::Node
  include RuboCop::AST::NodePattern::Node::ForbidInSeqHead
end
class RuboCop::AST::NodePattern::Node::Union < RuboCop::AST::NodePattern::Node
end
class RuboCop::AST::NodePattern::Parser < Racc::Parser
  extend Forwardable
end
module RuboCop::AST::NodePattern::Sets
end
module RuboCop::AST::Sexp
end
class RuboCop::AST::Node < Parser::AST::Node
  extend RuboCop::AST::NodePattern::Macros
  include RuboCop::AST::Descendence
  include RuboCop::AST::Sexp
end
module RuboCop::AST::MethodIdentifierPredicates
end
module RuboCop::AST::BinaryOperatorNode
end
module RuboCop::AST::CollectionNode
  extend Forwardable
end
module RuboCop::AST::ConditionalNode
end
module RuboCop::AST::HashElementNode
end
class RuboCop::AST::HashElementNode::HashElementDelta
end
module RuboCop::AST::MethodDispatchNode
  extend RuboCop::AST::NodePattern::Macros
  include RuboCop::AST::MethodIdentifierPredicates
end
module RuboCop::AST::ModifierNode
end
module RuboCop::AST::NumericNode
end
module RuboCop::AST::ParameterizedNode
end
module RuboCop::AST::ParameterizedNode::WrappedArguments
  include RuboCop::AST::ParameterizedNode
end
module RuboCop::AST::ParameterizedNode::RestArguments
  include RuboCop::AST::ParameterizedNode
end
module RuboCop::AST::PredicateOperatorNode
end
module RuboCop::AST::BasicLiteralNode
end
class RuboCop::AST::AliasNode < RuboCop::AST::Node
end
class RuboCop::AST::AndNode < RuboCop::AST::Node
  include RuboCop::AST::BinaryOperatorNode
  include RuboCop::AST::PredicateOperatorNode
end
class RuboCop::AST::ArgNode < RuboCop::AST::Node
end
class RuboCop::AST::ArgsNode < RuboCop::AST::Node
  include RuboCop::AST::CollectionNode
end
class RuboCop::AST::ArrayNode < RuboCop::AST::Node
end
class RuboCop::AST::AsgnNode < RuboCop::AST::Node
end
class RuboCop::AST::BlockNode < RuboCop::AST::Node
  include RuboCop::AST::MethodIdentifierPredicates
end
class RuboCop::AST::BreakNode < RuboCop::AST::Node
  include RuboCop::AST::ParameterizedNode::WrappedArguments
end
class RuboCop::AST::CaseMatchNode < RuboCop::AST::Node
  include RuboCop::AST::ConditionalNode
end
class RuboCop::AST::CaseNode < RuboCop::AST::Node
  include RuboCop::AST::ConditionalNode
end
class RuboCop::AST::CasgnNode < RuboCop::AST::Node
end
class RuboCop::AST::ClassNode < RuboCop::AST::Node
end
class RuboCop::AST::ConstNode < RuboCop::AST::Node
end
class RuboCop::AST::DefNode < RuboCop::AST::Node
  include RuboCop::AST::MethodIdentifierPredicates
  include RuboCop::AST::ParameterizedNode
end
class RuboCop::AST::DefinedNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode
end
class RuboCop::AST::EnsureNode < RuboCop::AST::Node
end
class RuboCop::AST::ForNode < RuboCop::AST::Node
end
class RuboCop::AST::ForwardArgsNode < RuboCop::AST::Node
  include RuboCop::AST::CollectionNode
end
class RuboCop::AST::FloatNode < RuboCop::AST::Node
  include RuboCop::AST::BasicLiteralNode
  include RuboCop::AST::NumericNode
end
class RuboCop::AST::HashNode < RuboCop::AST::Node
end
class RuboCop::AST::IfNode < RuboCop::AST::Node
  include RuboCop::AST::ConditionalNode
  include RuboCop::AST::ModifierNode
end
class RuboCop::AST::InPatternNode < RuboCop::AST::Node
end
class RuboCop::AST::IndexNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode::RestArguments
end
class RuboCop::AST::IndexasgnNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode::RestArguments
end
class RuboCop::AST::IntNode < RuboCop::AST::Node
  include RuboCop::AST::BasicLiteralNode
  include RuboCop::AST::NumericNode
end
class RuboCop::AST::KeywordSplatNode < RuboCop::AST::Node
  include RuboCop::AST::HashElementNode
end
class RuboCop::AST::LambdaNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode::RestArguments
end
class RuboCop::AST::ModuleNode < RuboCop::AST::Node
end
class RuboCop::AST::NextNode < RuboCop::AST::Node
  include RuboCop::AST::ParameterizedNode::WrappedArguments
end
class RuboCop::AST::OpAsgnNode < RuboCop::AST::Node
end
class RuboCop::AST::AndAsgnNode < RuboCop::AST::OpAsgnNode
end
class RuboCop::AST::OrAsgnNode < RuboCop::AST::OpAsgnNode
end
class RuboCop::AST::OrNode < RuboCop::AST::Node
  include RuboCop::AST::BinaryOperatorNode
  include RuboCop::AST::PredicateOperatorNode
end
class RuboCop::AST::PairNode < RuboCop::AST::Node
  include RuboCop::AST::HashElementNode
end
class RuboCop::AST::Procarg0Node < RuboCop::AST::ArgNode
end
class RuboCop::AST::RangeNode < RuboCop::AST::Node
end
class RuboCop::AST::RationalNode < RuboCop::AST::Node
  include RuboCop::AST::BasicLiteralNode
  include RuboCop::AST::NumericNode
end
class RuboCop::AST::RegexpNode < RuboCop::AST::Node
end
class RuboCop::AST::RescueNode < RuboCop::AST::Node
end
class RuboCop::AST::ResbodyNode < RuboCop::AST::Node
end
class RuboCop::AST::ReturnNode < RuboCop::AST::Node
  include RuboCop::AST::ParameterizedNode::WrappedArguments
end
class RuboCop::AST::SelfClassNode < RuboCop::AST::Node
end
class RuboCop::AST::SendNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode::RestArguments
end
class RuboCop::AST::CsendNode < RuboCop::AST::SendNode
end
class RuboCop::AST::StrNode < RuboCop::AST::Node
  include RuboCop::AST::BasicLiteralNode
end
class RuboCop::AST::DstrNode < RuboCop::AST::StrNode
end
class RuboCop::AST::SuperNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode
end
class RuboCop::AST::SymbolNode < RuboCop::AST::Node
  include RuboCop::AST::BasicLiteralNode
end
class RuboCop::AST::UntilNode < RuboCop::AST::Node
  include RuboCop::AST::ConditionalNode
  include RuboCop::AST::ModifierNode
end
class RuboCop::AST::WhenNode < RuboCop::AST::Node
end
class RuboCop::AST::WhileNode < RuboCop::AST::Node
  include RuboCop::AST::ConditionalNode
  include RuboCop::AST::ModifierNode
end
class RuboCop::AST::YieldNode < RuboCop::AST::Node
  include RuboCop::AST::MethodDispatchNode
  include RuboCop::AST::ParameterizedNode
end
class RuboCop::AST::Builder < Parser::Builders::Default
end
class RuboCop::AST::ProcessedSource
end
module RuboCop::AST::RuboCopCompatibility
end
class RuboCop::AST::Token
end
module RuboCop::AST::Traversal
  extend RuboCop::AST::Traversal::CallbackCompiler
end
class RuboCop::AST::Traversal::DebugError < RuntimeError
end
module RuboCop::AST::Traversal::CallbackCompiler
end
module RuboCop::AST::Version
end