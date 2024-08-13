# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/rouge/all/rouge.rbi
#
# rouge-4.3.0

module Rouge
end
class Rouge::InheritableHash < Hash
end
class Rouge::InheritableList
  include Enumerable
end
module Rouge::Indentation
end
class Rouge::TextAnalyzer < String
end
class Rouge::Token
end
module Rouge::Token::Tokens
end
class Rouge::Token::Tokens::Text::Whitespace < Rouge::Token::Tokens::Text
end
class Rouge::Token::Tokens::Text < Rouge::Token
end
class Rouge::Token::Tokens::Escape < Rouge::Token
end
class Rouge::Token::Tokens::Error < Rouge::Token
end
class Rouge::Token::Tokens::Other < Rouge::Token
end
class Rouge::Token::Tokens::Keyword::Constant < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Declaration < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Namespace < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Pseudo < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Reserved < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Type < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword::Variable < Rouge::Token::Tokens::Keyword
end
class Rouge::Token::Tokens::Keyword < Rouge::Token
end
class Rouge::Token::Tokens::Name::Attribute < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Builtin::Pseudo < Rouge::Token::Tokens::Name::Builtin
end
class Rouge::Token::Tokens::Name::Builtin < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Class < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Constant < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Decorator < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Entity < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Exception < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Function::Magic < Rouge::Token::Tokens::Name::Function
end
class Rouge::Token::Tokens::Name::Function < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Property < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Label < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Namespace < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Other < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Tag < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name::Variable::Class < Rouge::Token::Tokens::Name::Variable
end
class Rouge::Token::Tokens::Name::Variable::Global < Rouge::Token::Tokens::Name::Variable
end
class Rouge::Token::Tokens::Name::Variable::Instance < Rouge::Token::Tokens::Name::Variable
end
class Rouge::Token::Tokens::Name::Variable::Magic < Rouge::Token::Tokens::Name::Variable
end
class Rouge::Token::Tokens::Name::Variable < Rouge::Token::Tokens::Name
end
class Rouge::Token::Tokens::Name < Rouge::Token
end
class Rouge::Token::Tokens::Literal::Date < Rouge::Token::Tokens::Literal
end
class Rouge::Token::Tokens::Literal::String::Affix < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Backtick < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Char < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Delimiter < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Doc < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Double < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Escape < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Heredoc < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Interpol < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Other < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Regex < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Single < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String::Symbol < Rouge::Token::Tokens::Literal::String
end
class Rouge::Token::Tokens::Literal::String < Rouge::Token::Tokens::Literal
end
class Rouge::Token::Tokens::Literal::Number::Bin < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number::Float < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number::Hex < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number::Integer::Long < Rouge::Token::Tokens::Literal::Number::Integer
end
class Rouge::Token::Tokens::Literal::Number::Integer < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number::Oct < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number::Other < Rouge::Token::Tokens::Literal::Number
end
class Rouge::Token::Tokens::Literal::Number < Rouge::Token::Tokens::Literal
end
class Rouge::Token::Tokens::Literal < Rouge::Token
end
class Rouge::Token::Tokens::Operator::Word < Rouge::Token::Tokens::Operator
end
class Rouge::Token::Tokens::Operator < Rouge::Token
end
class Rouge::Token::Tokens::Punctuation::Indicator < Rouge::Token::Tokens::Punctuation
end
class Rouge::Token::Tokens::Punctuation < Rouge::Token
end
class Rouge::Token::Tokens::Comment::Hashbang < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::Doc < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::Multiline < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::Preproc < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::PreprocFile < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::Single < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment::Special < Rouge::Token::Tokens::Comment
end
class Rouge::Token::Tokens::Comment < Rouge::Token
end
class Rouge::Token::Tokens::Generic::Deleted < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Emph < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::EmphStrong < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Error < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Heading < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Inserted < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Lineno < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Output < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Prompt < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Strong < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Subheading < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic::Traceback < Rouge::Token::Tokens::Generic
end
class Rouge::Token::Tokens::Generic < Rouge::Token
end
class Rouge::Lexer
  include Rouge::Token::Tokens
end
module Rouge::Lexers
end
class Rouge::RegexLexer < Rouge::Lexer
end
class Rouge::RegexLexer::InvalidRegex < StandardError
end
class Rouge::RegexLexer::ClosedState < StandardError
end
class Rouge::RegexLexer::Rule
end
class Rouge::RegexLexer::State
end
class Rouge::RegexLexer::StateDSL
end
class Rouge::TemplateLexer < Rouge::RegexLexer
end
class Rouge::Lexers::ABAP < Rouge::RegexLexer
end
class Rouge::Lexers::Actionscript < Rouge::RegexLexer
end
class Rouge::Lexers::Ada < Rouge::RegexLexer
end
class Rouge::Lexers::Apache < Rouge::RegexLexer
end
class Rouge::Lexers::Apex < Rouge::RegexLexer
end
class Rouge::Lexers::Markdown < Rouge::RegexLexer
end
class Rouge::Lexers::APIBlueprint < Rouge::Lexers::Markdown
end
class Rouge::Lexers::AppleScript < Rouge::RegexLexer
end
class Rouge::Lexers::ArmAsm < Rouge::RegexLexer
end
class Rouge::Lexers::Augeas < Rouge::RegexLexer
end
class Rouge::Lexers::Awk < Rouge::RegexLexer
end
class Rouge::Lexers::Batchfile < Rouge::RegexLexer
end
class Rouge::Lexers::BBCBASIC < Rouge::RegexLexer
end
class Rouge::Lexers::BibTeX < Rouge::RegexLexer
end
class Rouge::Lexers::XML < Rouge::RegexLexer
end
class Rouge::Lexers::BIML < Rouge::Lexers::XML
end
class Rouge::Lexers::BPF < Rouge::RegexLexer
end
class Rouge::Lexers::Brainfuck < Rouge::RegexLexer
end
class Rouge::Lexers::Brightscript < Rouge::RegexLexer
end
class Rouge::Lexers::Bsl < Rouge::RegexLexer
end
class Rouge::Lexers::C < Rouge::RegexLexer
end
class Rouge::Lexers::Ceylon < Rouge::RegexLexer
end
class Rouge::Lexers::Cfscript < Rouge::RegexLexer
end
class Rouge::Lexers::CiscoIos < Rouge::RegexLexer
end
class Rouge::Lexers::Clean < Rouge::RegexLexer
end
class Rouge::Lexers::Clojure < Rouge::RegexLexer
end
class Rouge::Lexers::CMake < Rouge::RegexLexer
end
class Rouge::Lexers::CMHG < Rouge::RegexLexer
end
class Rouge::Lexers::Codeowners < Rouge::RegexLexer
end
class Rouge::Lexers::Coffeescript < Rouge::RegexLexer
end
class Rouge::Lexers::CommonLisp < Rouge::RegexLexer
end
class Rouge::Lexers::Conf < Rouge::RegexLexer
end
class Rouge::Lexers::ConsoleLexer < Rouge::Lexer
end
class Rouge::Lexers::Coq < Rouge::RegexLexer
end
class Rouge::Lexers::Cpp < Rouge::Lexers::C
end
class Rouge::Lexers::Crystal < Rouge::RegexLexer
end
class Rouge::Lexers::CSharp < Rouge::RegexLexer
end
class Rouge::Lexers::CSS < Rouge::RegexLexer
end
class Rouge::Lexers::CSVS < Rouge::RegexLexer
end
class Rouge::Lexers::CUDA < Rouge::Lexers::Cpp
end
class Rouge::Lexers::Cypher < Rouge::RegexLexer
end
class Rouge::Lexers::Python < Rouge::RegexLexer
end
class Rouge::Lexers::Python::StringRegister < Array
end
class Rouge::Lexers::Cython < Rouge::Lexers::Python
end
class Rouge::Lexers::D < Rouge::RegexLexer
end
class Rouge::Lexers::Dafny < Rouge::RegexLexer
end
class Rouge::Lexers::Dart < Rouge::RegexLexer
end
class Rouge::Lexers::Datastudio < Rouge::RegexLexer
end
class Rouge::Lexers::Diff < Rouge::RegexLexer
end
class Rouge::Lexers::YAML < Rouge::RegexLexer
end
class Rouge::Lexers::Digdag < Rouge::Lexers::YAML
end
class Rouge::Lexers::Docker < Rouge::RegexLexer
end
class Rouge::Lexers::Dot < Rouge::RegexLexer
end
class Rouge::Lexers::ECL < Rouge::RegexLexer
end
class Rouge::Lexers::EEX < Rouge::TemplateLexer
end
class Rouge::Lexers::Eiffel < Rouge::RegexLexer
end
class Rouge::Lexers::Elixir < Rouge::RegexLexer
end
class Rouge::Lexers::Elm < Rouge::RegexLexer
end
class Rouge::Lexers::Email < Rouge::RegexLexer
end
class Rouge::Lexers::EPP < Rouge::TemplateLexer
end
class Rouge::Lexers::ERB < Rouge::TemplateLexer
end
class Rouge::Lexers::Erlang < Rouge::RegexLexer
end
class Rouge::Lexers::Escape < Rouge::Lexer
end
class Rouge::Lexers::Factor < Rouge::RegexLexer
end
class Rouge::Lexers::Fluent < Rouge::RegexLexer
end
class Rouge::Lexers::Fortran < Rouge::RegexLexer
end
class Rouge::Lexers::FreeFEM < Rouge::Lexers::Cpp
end
class Rouge::Lexers::FSharp < Rouge::RegexLexer
end
class Rouge::Lexers::GDScript < Rouge::RegexLexer
end
class Rouge::Lexers::GHCCmm < Rouge::RegexLexer
end
class Rouge::Lexers::GHCCore < Rouge::RegexLexer
end
class Rouge::Lexers::Gherkin < Rouge::RegexLexer
end
class Rouge::Lexers::Glsl < Rouge::Lexers::C
end
class Rouge::Lexers::Go < Rouge::RegexLexer
end
class Rouge::Lexers::Groovy < Rouge::RegexLexer
end
class Rouge::Lexers::Gradle < Rouge::Lexers::Groovy
end
class Rouge::Lexers::GraphQL < Rouge::RegexLexer
end
class Rouge::Lexers::PHP < Rouge::TemplateLexer
end
class Rouge::Lexers::Hack < Rouge::Lexers::PHP
end
class Rouge::Lexers::Haml < Rouge::RegexLexer
  include Rouge::Indentation
end
class Rouge::Lexers::Handlebars < Rouge::TemplateLexer
end
class Rouge::Lexers::Haskell < Rouge::RegexLexer
end
class Rouge::Lexers::Haxe < Rouge::RegexLexer
end
class Rouge::Lexers::Hcl < Rouge::RegexLexer
end
class Rouge::Lexers::HLSL < Rouge::Lexers::C
end
class Rouge::Lexers::JSON < Rouge::RegexLexer
end
class Rouge::Lexers::HOCON < Rouge::Lexers::JSON
end
class Rouge::Lexers::SQL < Rouge::RegexLexer
end
class Rouge::Lexers::HQL < Rouge::Lexers::SQL
end
class Rouge::Lexers::HTML < Rouge::RegexLexer
end
class Rouge::Lexers::HTTP < Rouge::RegexLexer
end
class Rouge::Lexers::HyLang < Rouge::RegexLexer
end
class Rouge::Lexers::IDLang < Rouge::RegexLexer
end
class Rouge::Lexers::Idris < Rouge::RegexLexer
end
class Rouge::Lexers::IecST < Rouge::RegexLexer
end
class Rouge::Lexers::IgorPro < Rouge::RegexLexer
end
class Rouge::Lexers::INI < Rouge::RegexLexer
end
class Rouge::Lexers::IO < Rouge::RegexLexer
end
class Rouge::Lexers::IRBLexer < Rouge::Lexers::ConsoleLexer
end
class Rouge::Lexers::Ruby < Rouge::RegexLexer
end
class Rouge::Lexers::IRBOutputLexer < Rouge::Lexers::Ruby
end
class Rouge::Lexers::Isabelle < Rouge::RegexLexer
end
class Rouge::Lexers::ISBL < Rouge::RegexLexer
end
class Rouge::Lexers::J < Rouge::RegexLexer
end
class Rouge::Lexers::Janet < Rouge::RegexLexer
end
class Rouge::Lexers::Java < Rouge::RegexLexer
end
class Rouge::Lexers::Javascript < Rouge::RegexLexer
end
class Rouge::Lexers::Jinja < Rouge::TemplateLexer
end
class Rouge::Lexers::JSL < Rouge::RegexLexer
end
class Rouge::Lexers::JSONDOC < Rouge::Lexers::JSON
end
class Rouge::Lexers::Jsonnet < Rouge::RegexLexer
end
class Rouge::Lexers::JSP < Rouge::TemplateLexer
end
class Rouge::Lexers::JSX < Rouge::Lexers::Javascript
end
class Rouge::Lexers::Julia < Rouge::RegexLexer
end
class Rouge::Lexers::Kotlin < Rouge::RegexLexer
end
class Rouge::Lexers::Lasso < Rouge::TemplateLexer
end
class Rouge::Lexers::Lean < Rouge::RegexLexer
end
class Rouge::Lexers::Liquid < Rouge::RegexLexer
end
class Rouge::Lexers::LiterateCoffeescript < Rouge::RegexLexer
end
class Rouge::Lexers::LiterateHaskell < Rouge::RegexLexer
end
class Rouge::Lexers::Livescript < Rouge::RegexLexer
end
class Rouge::Lexers::LLVM < Rouge::RegexLexer
end
class Rouge::Lexers::Lua < Rouge::RegexLexer
end
class Rouge::Lexers::Lustre < Rouge::RegexLexer
end
class Rouge::Lexers::Lutin < Rouge::Lexers::Lustre
end
class Rouge::Lexers::M68k < Rouge::RegexLexer
end
class Rouge::Lexers::Magik < Rouge::RegexLexer
end
class Rouge::Lexers::Make < Rouge::RegexLexer
end
class Rouge::Lexers::Mason < Rouge::TemplateLexer
end
class Rouge::Lexers::Mathematica < Rouge::RegexLexer
end
class Rouge::Lexers::Matlab < Rouge::RegexLexer
end
class Rouge::Lexers::Meson < Rouge::RegexLexer
end
class Rouge::Lexers::Meson::StringRegister < Array
end
class Rouge::Lexers::MiniZinc < Rouge::RegexLexer
end
class Rouge::Lexers::Moonscript < Rouge::RegexLexer
end
class Rouge::Lexers::Mosel < Rouge::RegexLexer
end
class Rouge::Lexers::MsgTrans < Rouge::RegexLexer
end
class Rouge::Lexers::MXML < Rouge::RegexLexer
end
class Rouge::Lexers::Nasm < Rouge::RegexLexer
end
class Rouge::Lexers::NesAsm < Rouge::RegexLexer
end
class Rouge::Lexers::Nginx < Rouge::RegexLexer
end
class Rouge::Lexers::Nial < Rouge::RegexLexer
end
class Rouge::Lexers::Nim < Rouge::RegexLexer
end
class Rouge::Lexers::Nix < Rouge::RegexLexer
end
module Rouge::Lexers::ObjectiveCCommon
end
class Rouge::Lexers::ObjectiveC < Rouge::Lexers::C
  extend Rouge::Lexers::ObjectiveCCommon
end
class Rouge::Lexers::ObjectiveCpp < Rouge::Lexers::Cpp
  extend Rouge::Lexers::ObjectiveCCommon
end
class Rouge::Lexers::OCamlCommon < Rouge::RegexLexer
end
class Rouge::Lexers::OCaml < Rouge::Lexers::OCamlCommon
end
class Rouge::Lexers::OCL < Rouge::RegexLexer
end
class Rouge::Lexers::OpenEdge < Rouge::RegexLexer
end
class Rouge::Lexers::OpenTypeFeatureFile < Rouge::RegexLexer
end
class Rouge::Lexers::Pascal < Rouge::RegexLexer
end
class Rouge::Lexers::Perl < Rouge::RegexLexer
end
class Rouge::Lexers::PlainText < Rouge::Lexer
end
class Rouge::Lexers::Plist < Rouge::RegexLexer
end
class Rouge::Lexers::PLSQL < Rouge::RegexLexer
end
class Rouge::Lexers::Pony < Rouge::RegexLexer
end
class Rouge::Lexers::PostScript < Rouge::RegexLexer
end
class Rouge::Lexers::Powershell < Rouge::RegexLexer
end
class Rouge::Lexers::Praat < Rouge::RegexLexer
end
class Rouge::Lexers::Prolog < Rouge::RegexLexer
end
class Rouge::Lexers::Prometheus < Rouge::RegexLexer
end
class Rouge::Lexers::Properties < Rouge::RegexLexer
end
class Rouge::Lexers::Protobuf < Rouge::RegexLexer
end
class Rouge::Lexers::Puppet < Rouge::RegexLexer
end
class Rouge::Lexers::Q < Rouge::RegexLexer
end
class Rouge::Lexers::Qml < Rouge::Lexers::Javascript
end
class Rouge::Lexers::R < Rouge::RegexLexer
end
class Rouge::Lexers::Racket < Rouge::RegexLexer
end
class Rouge::Lexers::ReasonML < Rouge::Lexers::OCamlCommon
end
class Rouge::Lexers::Rego < Rouge::RegexLexer
end
class Rouge::Lexers::ReScript < Rouge::Lexers::OCamlCommon
end
class Rouge::Lexers::RML < Rouge::RegexLexer
end
class Rouge::Lexers::RobotFramework < Rouge::RegexLexer
end
class Rouge::Lexers::Rust < Rouge::RegexLexer
end
class Rouge::Lexers::SAS < Rouge::RegexLexer
end
class Rouge::Lexers::SassCommon < Rouge::RegexLexer
end
class Rouge::Lexers::Sass < Rouge::Lexers::SassCommon
  include Rouge::Indentation
end
class Rouge::Lexers::Scala < Rouge::RegexLexer
end
class Rouge::Lexers::Scheme < Rouge::RegexLexer
end
class Rouge::Lexers::Scss < Rouge::Lexers::SassCommon
end
class Rouge::Lexers::Sed < Rouge::RegexLexer
end
class Rouge::Lexers::Sed::Regex < Rouge::RegexLexer
end
class Rouge::Lexers::Sed::Replacement < Rouge::RegexLexer
end
class Rouge::Lexers::Shell < Rouge::RegexLexer
end
class Rouge::Lexers::Sieve < Rouge::RegexLexer
end
class Rouge::Lexers::Slice < Rouge::Lexers::C
end
class Rouge::Lexers::Slim < Rouge::RegexLexer
  include Rouge::Indentation
end
class Rouge::Lexers::Smalltalk < Rouge::RegexLexer
end
class Rouge::Lexers::Smarty < Rouge::TemplateLexer
end
class Rouge::Lexers::SML < Rouge::RegexLexer
end
class Rouge::Lexers::SPARQL < Rouge::RegexLexer
end
class Rouge::Lexers::SQF < Rouge::RegexLexer
end
class Rouge::Lexers::SSH < Rouge::RegexLexer
end
class Rouge::Lexers::Stan < Rouge::RegexLexer
end
class Rouge::Lexers::Stata < Rouge::RegexLexer
end
class Rouge::Lexers::SuperCollider < Rouge::RegexLexer
end
class Rouge::Lexers::Svelte < Rouge::Lexers::HTML
end
class Rouge::Lexers::Swift < Rouge::RegexLexer
end
class Rouge::Lexers::SystemD < Rouge::RegexLexer
end
class Rouge::Lexers::Syzlang < Rouge::RegexLexer
end
class Rouge::Lexers::Syzprog < Rouge::RegexLexer
end
class Rouge::Lexers::Tap < Rouge::RegexLexer
end
class Rouge::Lexers::TCL < Rouge::RegexLexer
end
class Rouge::Lexers::Terraform < Rouge::Lexers::Hcl
end
class Rouge::Lexers::TeX < Rouge::RegexLexer
end
class Rouge::Lexers::TOML < Rouge::RegexLexer
end
module Rouge::Lexers::TypescriptCommon
end
class Rouge::Lexers::TSX < Rouge::Lexers::JSX
  extend Rouge::Lexers::TypescriptCommon
end
class Rouge::Lexers::TTCN3 < Rouge::RegexLexer
end
class Rouge::Lexers::Tulip < Rouge::RegexLexer
end
class Rouge::Lexers::Turtle < Rouge::RegexLexer
end
class Rouge::Lexers::Twig < Rouge::Lexers::Jinja
end
class Rouge::Lexers::Typescript < Rouge::Lexers::Javascript
  extend Rouge::Lexers::TypescriptCommon
end
class Rouge::Lexers::Vala < Rouge::RegexLexer
end
class Rouge::Lexers::Varnish < Rouge::RegexLexer
end
class Rouge::Lexers::VisualBasic < Rouge::RegexLexer
end
class Rouge::Lexers::Velocity < Rouge::TemplateLexer
end
class Rouge::Lexers::Verilog < Rouge::RegexLexer
end
class Rouge::Lexers::VHDL < Rouge::RegexLexer
end
class Rouge::Lexers::VimL < Rouge::RegexLexer
end
class Rouge::Lexers::Vue < Rouge::Lexers::HTML
end
class Rouge::Lexers::Wollok < Rouge::RegexLexer
end
class Rouge::Lexers::Xojo < Rouge::RegexLexer
end
class Rouge::Lexers::XPath < Rouge::RegexLexer
end
class Rouge::Lexers::XQuery < Rouge::Lexers::XPath
end
class Rouge::Lexers::YANG < Rouge::RegexLexer
end
class Rouge::Lexers::Zig < Rouge::RegexLexer
end
class Rouge::Guesser
end
class Rouge::Guesser::Ambiguous < StandardError
end
module Rouge::Guessers
end
module Rouge::Guessers::Util
end
module Rouge::Guessers::Util::SourceNormalizer
end
class Rouge::Guessers::GlobMapping < Rouge::Guesser
  include Rouge::Guessers::Util
end
class Rouge::Guessers::Modeline < Rouge::Guesser
  include Rouge::Guessers::Util
end
class Rouge::Guessers::Filename < Rouge::Guesser
end
class Rouge::Guessers::Mimetype < Rouge::Guesser
end
class Rouge::Guessers::Source < Rouge::Guesser
  include Rouge::Guessers::Util
end
class Rouge::Guessers::Disambiguation < Rouge::Guesser
  include Rouge::Guessers::Util
  include Rouge::Lexers
end
class Rouge::Guessers::Disambiguation::Disambiguator
  include Rouge::Guessers::Util
end
class Rouge::Formatter
end
module Rouge::Formatters
end
class Rouge::Formatters::HTML < Rouge::Formatter
end
class Rouge::Formatters::HTMLTable < Rouge::Formatter
end
class Rouge::Formatters::HTMLPygments < Rouge::Formatter
end
class Rouge::Formatters::HTMLLegacy < Rouge::Formatter
end
class Rouge::Formatters::HTMLLinewise < Rouge::Formatter
end
class Rouge::Formatters::HTMLLineHighlighter < Rouge::Formatter
end
class Rouge::Formatters::HTMLLineTable < Rouge::Formatter
end
class Rouge::Formatters::HTMLInline < Rouge::Formatters::HTML
end
class Rouge::Formatters::Terminal256 < Rouge::Formatter
end
class Rouge::Formatters::Terminal256::EscapeSequence
end
class Rouge::Formatters::Terminal256::Unescape < Rouge::Formatters::Terminal256::EscapeSequence
end
class Rouge::Formatters::TerminalTruecolor < Rouge::Formatters::Terminal256
end
class Rouge::Formatters::TerminalTruecolor::TruecolorEscapeSequence < Rouge::Formatters::Terminal256::EscapeSequence
end
class Rouge::Formatters::Tex < Rouge::Formatter
end
class Rouge::Formatters::Null < Rouge::Formatter
end
class Rouge::Theme
  include Rouge::Token::Tokens
end
class Rouge::Theme::Style < Hash
end
module Rouge::HasModes
end
class Rouge::CSSTheme < Rouge::Theme
end
class Rouge::TexThemeRenderer
end
module Rouge::Themes
end
class Rouge::Themes::ThankfulEyes < Rouge::CSSTheme
end
class Rouge::Themes::Colorful < Rouge::CSSTheme
end
class Rouge::Themes::Base16 < Rouge::CSSTheme
  extend Rouge::HasModes
end
class Rouge::Themes::Base16::Solarized < Rouge::Themes::Base16
end
class Rouge::Themes::Base16::Monokai < Rouge::Themes::Base16
end
class Rouge::Themes::Github < Rouge::CSSTheme
  extend Rouge::HasModes
end
class Rouge::Themes::IgorPro < Rouge::CSSTheme
end
class Rouge::Themes::Monokai < Rouge::CSSTheme
end
class Rouge::Themes::Molokai < Rouge::CSSTheme
end
class Rouge::Themes::MonokaiSublime < Rouge::CSSTheme
end
class Rouge::Themes::Gruvbox < Rouge::CSSTheme
  extend Rouge::HasModes
end
class Rouge::Themes::Tulip < Rouge::CSSTheme
end
class Rouge::Themes::Pastie < Rouge::CSSTheme
end
class Rouge::Themes::BlackWhiteTheme < Rouge::CSSTheme
end
class Rouge::Themes::Magritte < Rouge::CSSTheme
end
