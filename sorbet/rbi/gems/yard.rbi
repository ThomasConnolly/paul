# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/yard/all/yard.rbi
#
# yard-0.9.36

module YARD
end
module YARD::Server
end
module YARD::CLI
end
module YARD::CodeObjects
  extend YARD::CodeObjects::NamespaceMapper
end
module YARD::Handlers
end
module YARD::Handlers::Common
end
module YARD::Handlers::C
end
module YARD::Handlers::Ruby
end
module YARD::Handlers::Ruby::Legacy
end
module YARD::I18n
end
module YARD::Parser
end
module YARD::Parser::C
end
module YARD::Parser::Ruby
end
module YARD::Parser::Ruby::Legacy
end
module YARD::Rake
end
module YARD::Serializers
end
module YARD::Server::Commands
end
module YARD::Tags
end
module YARD::Templates
end
module YARD::Templates::Helpers
end
module YARD::Templates::Helpers::Markup
end
class YARD::Config
end
class Array
end
class File < IO
end
class Insertion
end
class Module
end
class String
end
class SymbolHash < Hash
end
module Gem
end
class Gem::SourceIndex
  include Enumerable
end
class YARD::Options
end
class YARD::Templates::TemplateOptions < YARD::Options
end
class YARD::CLI::Command
end
class YARD::CLI::YardoptsCommand < YARD::CLI::Command
end
class YARD::CLI::YardocOptions < YARD::Templates::TemplateOptions
end
class YARD::CLI::Yardoc < YARD::CLI::YardoptsCommand
end
module YARD::CodeObjects::NamespaceMapper
end
class YARD::CodeObjects::CodeObjectList < Array
end
class YARD::CodeObjects::Base
end
class YARD::CodeObjects::MethodObject < YARD::CodeObjects::Base
end
class YARD::DocstringParser
end
class YARD::Docstring < String
end
class YARD::Parser::Base
end
class YARD::Parser::Ruby::AstNode < Array
end
class YARD::Parser::Ruby::ReferenceNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::LiteralNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::KeywordNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::ParameterNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::MethodCallNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::MethodDefinitionNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::ConditionalNode < YARD::Parser::Ruby::KeywordNode
end
class YARD::Parser::Ruby::ClassNode < YARD::Parser::Ruby::KeywordNode
end
class YARD::Parser::Ruby::ModuleNode < YARD::Parser::Ruby::KeywordNode
end
class YARD::Parser::Ruby::LoopNode < YARD::Parser::Ruby::KeywordNode
end
class YARD::Parser::Ruby::CommentNode < YARD::Parser::Ruby::AstNode
end
class YARD::Parser::Ruby::RubyParser < YARD::Parser::Base
end
class YARD::Parser::Ruby::RipperParser < Ripper
end
class YARD::Parser::Ruby::Legacy::RubyParser < YARD::Parser::Base
end
class YARD::Parser::C::CParser < YARD::Parser::Base
end
class YARD::Parser::UndocumentableError < RuntimeError
end
class YARD::Parser::ParserSyntaxError < YARD::Parser::UndocumentableError
end
class YARD::Parser::OrderedParser
end
class YARD::Parser::SourceParser
end
class YARD::Handlers::HandlerAborted < RuntimeError
end
class YARD::Handlers::NamespaceMissingError < YARD::Parser::UndocumentableError
end
class YARD::Handlers::Base
  include YARD::CodeObjects
  include YARD::Parser
end
class YARD::Handlers::Ruby::HandlesExtension
end
class YARD::Handlers::Ruby::MethodCallWrapper < YARD::Handlers::Ruby::HandlesExtension
end
class YARD::Handlers::Ruby::TestNodeWrapper < YARD::Handlers::Ruby::HandlesExtension
end
class YARD::Handlers::Ruby::Base < YARD::Handlers::Base
  include YARD::Parser::Ruby
end
module YARD::Registry
  extend Enumerable
end
class YARD::Tags::Tag
end
class YARD::Tags::OverloadTag < YARD::Tags::Tag
end
class YARD::Tags::Directive
end
class YARD::Tags::EndGroupDirective < YARD::Tags::Directive
end
class YARD::Tags::GroupDirective < YARD::Tags::Directive
end
class YARD::Tags::MacroDirective < YARD::Tags::Directive
end
class YARD::Tags::MethodDirective < YARD::Tags::Directive
end
class YARD::Tags::AttributeDirective < YARD::Tags::MethodDirective
end
class YARD::Tags::ParseDirective < YARD::Tags::Directive
end
class YARD::Tags::ScopeDirective < YARD::Tags::Directive
end
class YARD::Tags::VisibilityDirective < YARD::Tags::Directive
end
class YARD::Tags::Library
end
module YARD::Handlers::Ruby::StructHandlerMethods
  include YARD::CodeObjects
end
class YARD::Handlers::Ruby::ClassHandler < YARD::Handlers::Ruby::Base
  include Anonymous_Module_115
  include YARD::Handlers::Ruby::StructHandlerMethods
end
module Anonymous_Module_115
end
