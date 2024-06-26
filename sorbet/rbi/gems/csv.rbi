# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: false
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/csv/all/csv.rbi
#
# csv-3.3.0

class CSV
  def <<(row); end
  def add_row(row); end
  def binmode(*args, **, &block); end
  def binmode?; end
  def build_fields_converter(initial_converters, options); end
  def build_header_fields_converter; end
  def build_parser_fields_converter; end
  def build_writer_fields_converter; end
  def close(*args, **, &block); end
  def close_read(*args, **, &block); end
  def close_write(*args, **, &block); end
  def closed?(*args, **, &block); end
  def col_sep; end
  def convert(name = nil, &converter); end
  def convert_fields(fields, headers = nil); end
  def converters; end
  def determine_encoding(encoding, internal_encoding); end
  def each(&block); end
  def encoding; end
  def eof; end
  def eof?; end
  def external_encoding(*args, **, &block); end
  def fcntl(*args, **, &block); end
  def field_size_limit; end
  def fileno(*args, **, &block); end
  def flock(*args); end
  def flush(*args, **, &block); end
  def force_quotes?; end
  def fsync(*args, **, &block); end
  def gets; end
  def header_convert(name = nil, &converter); end
  def header_converters; end
  def header_fields_converter; end
  def header_row?; end
  def headers; end
  def initialize(data, col_sep: nil, row_sep: nil, quote_char: nil, field_size_limit: nil, max_field_size: nil, converters: nil, unconverted_fields: nil, headers: nil, return_headers: nil, write_headers: nil, header_converters: nil, skip_blanks: nil, force_quotes: nil, skip_lines: nil, liberal_parsing: nil, internal_encoding: nil, external_encoding: nil, encoding: nil, nil_value: nil, empty_value: nil, strip: nil, quote_empty: nil, write_converters: nil, write_nil_value: nil, write_empty_value: nil); end
  def inspect; end
  def internal_encoding(*args, **, &block); end
  def ioctl(*args); end
  def isatty(*args, **, &block); end
  def liberal_parsing?; end
  def line; end
  def lineno; end
  def max_field_size; end
  def normalize_converters(converters); end
  def parser; end
  def parser_enumerator; end
  def parser_fields_converter; end
  def parser_options; end
  def path; end
  def pid(*args, **, &block); end
  def pos(*args, **, &block); end
  def pos=(*args, **, &block); end
  def puts(row); end
  def quote_char; end
  def raw_encoding; end
  def read; end
  def readline; end
  def readlines; end
  def reopen(*args, **, &block); end
  def return_headers?; end
  def rewind; end
  def row_sep; end
  def seek(*args, **, &block); end
  def self.filter(input = nil, output = nil, **options); end
  def self.foreach(path, mode = nil, **options, &block); end
  def self.generate(str = nil, **options); end
  def self.generate_line(row, **options); end
  def self.generate_lines(rows, **options); end
  def self.instance(data = nil, **options); end
  def self.open(filename, mode = nil, **options); end
  def self.parse(str, **options, &block); end
  def self.parse_line(line, **options); end
  def self.read(path, **options); end
  def self.readlines(path, **options); end
  def self.table(path, **options); end
  def shift; end
  def skip_blanks?; end
  def skip_lines; end
  def stat(*args); end
  def string(*args, **, &block); end
  def sync(*args, **, &block); end
  def sync=(*args, **, &block); end
  def tell(*args, **, &block); end
  def to_i; end
  def to_io; end
  def truncate(*args, **, &block); end
  def tty?(*args, **, &block); end
  def unconverted_fields?; end
  def write_headers?; end
  def writer; end
  def writer_fields_converter; end
  def writer_options; end
  extend Forwardable
  include Enumerable
end
class CSV::FieldsConverter
  def add_converter(name = nil, &converter); end
  def builtin_converters; end
  def convert(fields, headers, lineno, quoted_fields); end
  def each(&block); end
  def empty?; end
  def initialize(options = nil); end
  def need_convert?; end
  def need_static_convert?; end
  include Enumerable
end
module CSV::InputRecordSeparator
  def self.value; end
end
class CSV::Row
  def <<(arg); end
  def ==(other); end
  def [](header_or_index, minimum_index = nil); end
  def []=(*args); end
  def deconstruct; end
  def deconstruct_keys(keys); end
  def delete(header_or_index, minimum_index = nil); end
  def delete_if(&block); end
  def dig(index_or_header, *indexes); end
  def each(&block); end
  def each_pair(&block); end
  def empty?(*args, **, &block); end
  def fetch(header, *varargs); end
  def field(header_or_index, minimum_index = nil); end
  def field?(data); end
  def field_row?; end
  def fields(*headers_and_or_indices); end
  def has_key?(header); end
  def header?(header); end
  def header_row?; end
  def headers; end
  def include?(header); end
  def index(header, minimum_index = nil); end
  def initialize(headers, fields, header_row = nil); end
  def initialize_copy(other); end
  def inspect; end
  def key?(header); end
  def length(*args, **, &block); end
  def member?(header); end
  def push(*args); end
  def row; end
  def size(*args, **, &block); end
  def to_ary(*arg0); end
  def to_csv(**options); end
  def to_h; end
  def to_hash; end
  def to_s(**options); end
  def values_at(*headers_and_or_indices); end
  extend Forwardable
  include Enumerable
end
class CSV::Table
  def <<(row_or_array); end
  def ==(other); end
  def [](index_or_header); end
  def []=(index_or_header, value); end
  def by_col!; end
  def by_col; end
  def by_col_or_row!; end
  def by_col_or_row; end
  def by_row!; end
  def by_row; end
  def delete(*indexes_or_headers); end
  def delete_if(&block); end
  def dig(index_or_header, *index_or_headers); end
  def each(&block); end
  def empty?(*args, **, &block); end
  def headers; end
  def initialize(array_of_rows, headers: nil); end
  def inspect; end
  def length(*args, **, &block); end
  def mode; end
  def push(*rows); end
  def size(*args, **, &block); end
  def table; end
  def to_a; end
  def to_csv(write_headers: nil, limit: nil, **options); end
  def to_s(write_headers: nil, limit: nil, **options); end
  def values_at(*indices_or_headers); end
  extend Forwardable
  include Enumerable
end
class CSV::Parser
  def add_unconverted_fields(row, fields); end
  def adjust_headers(headers, quoted_fields); end
  def build_scanner; end
  def column_separator; end
  def detect_row_separator(sample, cr, lf); end
  def emit_row(row, quoted_fields, &block); end
  def field_size_limit; end
  def header_row?; end
  def headers; end
  def ignore_broken_line; end
  def initialize(input, options); end
  def last_line; end
  def liberal_parsing?; end
  def line; end
  def lineno; end
  def max_field_size; end
  def may_quoted?; end
  def parse(&block); end
  def parse_column_end; end
  def parse_column_value; end
  def parse_headers(row); end
  def parse_no_quote(&block); end
  def parse_quotable_loose(&block); end
  def parse_quotable_robust(&block); end
  def parse_quoted_column_value; end
  def parse_row_end; end
  def parse_unquoted_column_value; end
  def prepare; end
  def prepare_backslash; end
  def prepare_header; end
  def prepare_line; end
  def prepare_parser; end
  def prepare_quote_character; end
  def prepare_quoted; end
  def prepare_separators; end
  def prepare_skip_lines; end
  def prepare_strip; end
  def prepare_unquoted; end
  def prepare_variable; end
  def quote_character; end
  def resolve_row_separator(separator); end
  def return_headers?; end
  def row_separator; end
  def skip_blanks?; end
  def skip_line?(line); end
  def skip_lines; end
  def skip_needless_lines; end
  def start_row; end
  def strip_value(value); end
  def unconverted_fields?; end
  def use_headers?; end
  def validate_field_size(field); end
  def validate_strip_and_col_sep_options; end
end
class CSV::Parser::InvalidEncoding < StandardError
end
class CSV::Parser::UnexpectedError < StandardError
end
class CSV::Parser::Scanner < StringScanner
  def each_line(row_separator); end
  def initialize(*args); end
  def keep_back; end
  def keep_drop; end
  def keep_end; end
  def keep_start; end
  def scan_all(arg0); end
end
class CSV::Parser::InputsScanner
  def adjust_last_keep; end
  def check(pattern); end
  def each_line(row_separator); end
  def eos?; end
  def initialize(inputs, encoding, row_separator, chunk_size: nil); end
  def keep_back; end
  def keep_drop; end
  def keep_end; end
  def keep_start; end
  def read_chunk; end
  def rest; end
  def scan(pattern); end
  def scan_all(pattern); end
  def trace(*args); end
end
class CSV::Parser::UnoptimizedStringIO
  def each_line(*args, &block); end
  def eof?; end
  def gets(*args); end
  def initialize(string); end
end
class CSV::Writer
  def <<(row); end
  def headers; end
  def initialize(output, options); end
  def lineno; end
  def prepare; end
  def prepare_force_quotes_fields(force_quotes); end
  def prepare_format; end
  def prepare_header; end
  def prepare_output; end
  def quote(field, i); end
  def quote_field(field); end
  def rewind; end
end
class Array
  def to_csv(**options); end
end
class String
  def parse_csv(**options); end
end
class CSV::MalformedCSVError < RuntimeError
  def initialize(message, line_number); end
  def line_number; end
  def lineno; end
end
class CSV::InvalidEncodingError < CSV::MalformedCSVError
  def encoding; end
  def initialize(encoding, line_number); end
end
class CSV::FieldInfo < Struct
  def header; end
  def header=(_); end
  def index; end
  def index=(_); end
  def line; end
  def line=(_); end
  def quoted?; end
  def self.[](*arg0); end
  def self.inspect; end
  def self.keyword_init?; end
  def self.members; end
  def self.new(*arg0); end
end
class Object < BasicObject
  def CSV(*args, **options, &block); end
end
