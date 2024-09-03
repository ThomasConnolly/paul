# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/amazing_print/all/amazing_print.rbi
#
# amazing_print-1.6.0

module AwesomeMethodArray
  def &(other); end
  def -(other); end
  def grep(pattern, &blk); end
end
class Object < BasicObject
  def methods(*args); end
  def private_methods(*args); end
  def protected_methods(*args); end
  def public_methods(*args); end
  def singleton_methods(*args); end
end
class Class < Module
  def instance_methods(*args); end
  def private_instance_methods(*args); end
  def protected_instance_methods(*args); end
  def public_instance_methods(*args); end
end
module Kernel
  def ai(options = nil); end
  def amazing_print(object, options = nil); end
  def ap(object, options = nil); end
  def awesome_inspect(options = nil); end
  def self.ap(object, options = nil); end
end
module AmazingPrint
  def self.boolean(value); end
  def self.console?; end
  def self.defaults; end
  def self.defaults=(arg0); end
  def self.diet_rb; end
  def self.force_colors!(colors: nil); end
  def self.force_colors; end
  def self.force_colors=(arg0); end
  def self.irb!; end
  def self.pry!; end
  def self.rails_console?; end
  def self.reload!; end
  def self.usual_rb; end
  def self.version; end
end
class AmazingPrint::Indentator
  def indent; end
  def indentation; end
  def initialize(indentation); end
  def shift_width; end
end
class AmazingPrint::ExtLoader
  def self.call; end
end
class AmazingPrint::Inspector
  def awesome(object); end
  def colorize?; end
  def current_indentation; end
  def dotfile_readable?(dotfile); end
  def find_dotfile; end
  def increase_indentation(&blk); end
  def indentator; end
  def indentator=(arg0); end
  def initialize(options = nil); end
  def load_dotfile; end
  def merge_custom_defaults!; end
  def merge_options!(options = nil); end
  def nested(object); end
  def options; end
  def options=(arg0); end
  def printable(object); end
  def self.reload_dotfile; end
  def unnested(object); end
end
module AmazingPrint::Colors
  def blue(str, html = nil); end
  def blueish(str, html = nil); end
  def cyan(str, html = nil); end
  def cyanish(str, html = nil); end
  def gray(str, html = nil); end
  def grayish(str, html = nil); end
  def green(str, html = nil); end
  def greenish(str, html = nil); end
  def purple(str, html = nil); end
  def purpleish(str, html = nil); end
  def red(str, html = nil); end
  def redish(str, html = nil); end
  def self.blue(str, html = nil); end
  def self.blueish(str, html = nil); end
  def self.cyan(str, html = nil); end
  def self.cyanish(str, html = nil); end
  def self.gray(str, html = nil); end
  def self.grayish(str, html = nil); end
  def self.green(str, html = nil); end
  def self.greenish(str, html = nil); end
  def self.purple(str, html = nil); end
  def self.purpleish(str, html = nil); end
  def self.red(str, html = nil); end
  def self.redish(str, html = nil); end
  def self.white(str, html = nil); end
  def self.whiteish(str, html = nil); end
  def self.yellow(str, html = nil); end
  def self.yellowish(str, html = nil); end
  def white(str, html = nil); end
  def whiteish(str, html = nil); end
  def yellow(str, html = nil); end
  def yellowish(str, html = nil); end
end
module AmazingPrint::Colorize
  def colorize(str, type); end
end
module AmazingPrint::Formatters
end
class AmazingPrint::Formatters::BaseFormatter
  def align(value, width); end
  def colorless_size(string); end
  def get_limit_size; end
  def indent(n = nil); end
  def indentation; end
  def indented(&blk); end
  def limited(data, width, is_hash: nil); end
  def method_tuple(method); end
  def outdent; end
  def should_be_limited?; end
  include AmazingPrint::Colorize
end
class AmazingPrint::Formatters::ObjectFormatter < AmazingPrint::Formatters::BaseFormatter
  def awesome_instance; end
  def format; end
  def initialize(object, inspector); end
  def inspector; end
  def left_aligned; end
  def object; end
  def options; end
  def valid_instance_var?(variable_name); end
  def variables; end
end
class AmazingPrint::Formatters::StructFormatter < AmazingPrint::Formatters::BaseFormatter
  def awesome_instance; end
  def format; end
  def initialize(struct, inspector); end
  def inspector; end
  def left_aligned; end
  def options; end
  def struct; end
  def variables; end
end
class AmazingPrint::Formatters::HashFormatter < AmazingPrint::Formatters::BaseFormatter
  def empty_hash; end
  def format; end
  def hash; end
  def initialize(hash, inspector); end
  def inspector; end
  def left_width(keys); end
  def max_key_width(keys); end
  def multiline_hash; end
  def multiline_hash?; end
  def options; end
  def plain_single_line; end
  def pre_ruby19_syntax(key, value, width); end
  def printable_hash; end
  def printable_keys; end
  def ruby19_syntax(key, value, width); end
  def simple_hash; end
  def symbol?(key); end
end
class AmazingPrint::Formatters::ArrayFormatter < AmazingPrint::Formatters::BaseFormatter
  def array; end
  def array_prefix(iteration, width); end
  def find_method(name); end
  def format; end
  def generate_printable_array; end
  def generate_printable_tuples; end
  def generate_tuple(name); end
  def generic_prefix(iteration, width, padding = nil); end
  def initialize(array, inspector); end
  def inspector; end
  def methods_array; end
  def methods_array?; end
  def multiline_array; end
  def name_and_args_width; end
  def options; end
  def simple_array; end
  def tuple_prefix(iteration, width); end
  def tuple_template(item); end
  def tuples; end
  def width(items); end
end
class AmazingPrint::Formatters::SimpleFormatter < AmazingPrint::Formatters::BaseFormatter
  def format; end
  def initialize(string, type, inspector); end
  def inspector; end
  def options; end
  def string; end
  def type; end
end
class AmazingPrint::Formatters::MethodFormatter < AmazingPrint::Formatters::BaseFormatter
  def format; end
  def initialize(method, inspector); end
  def inspector; end
  def method; end
  def options; end
end
class AmazingPrint::Formatters::ClassFormatter < AmazingPrint::Formatters::BaseFormatter
  def format; end
  def initialize(klass, inspector); end
  def inspector; end
  def klass; end
  def options; end
end
class AmazingPrint::Formatters::DirFormatter < AmazingPrint::Formatters::BaseFormatter
  def dir; end
  def format; end
  def info; end
  def initialize(dir, inspector); end
  def inspector; end
  def options; end
end
class AmazingPrint::Formatters::FileFormatter < AmazingPrint::Formatters::BaseFormatter
  def file; end
  def format; end
  def info; end
  def initialize(file, inspector); end
  def inspector; end
  def options; end
end
class AmazingPrint::Formatter
  def awesome_array(a); end
  def awesome_bigdecimal(n); end
  def awesome_class(c); end
  def awesome_dir(d); end
  def awesome_file(f); end
  def awesome_hash(h); end
  def awesome_method(m); end
  def awesome_object(o); end
  def awesome_rational(n); end
  def awesome_self(object, type); end
  def awesome_set(s); end
  def awesome_simple(o, type, inspector = nil); end
  def awesome_struct(s); end
  def awesome_unboundmethod(m); end
  def cast(object, type); end
  def cast_without_active_record(_object, type); end
  def cast_without_active_support(object, type); end
  def cast_without_nokogiri(object, type); end
  def convert_to_hash(object); end
  def format(object, type = nil); end
  def initialize(inspector); end
  def inspector; end
  def options; end
  include AmazingPrint::ActiveRecord
  include AmazingPrint::ActiveSupport
  include AmazingPrint::Colorize
  include AmazingPrint::Nokogiri
end
module AmazingPrint::Logger
  def ap(object, options = nil); end
end
class Logger
  include AmazingPrint::Logger
end
module AmazingPrint::ActiveRecord
  def awesome_active_model_error(object); end
  def awesome_active_record_class(object); end
  def awesome_active_record_instance(object); end
  def cast_with_active_record(object, type); end
  def self.included(base); end
end
module AmazingPrint::ActiveSupport
  def awesome_active_support_time(object); end
  def awesome_hash_with_indifferent_access(object); end
  def cast_with_active_support(object, type); end
  def self.included(base); end
end
module AmazingPrint::Nokogiri
  def awesome_nokogiri_xml_node(object); end
  def cast_with_nokogiri(object, type); end
  def self.included(base); end
end
module AmazingPrint::ActionView
end
class ActionView::Base
  include AmazingPrint::ActionView
end