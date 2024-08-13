# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/geocoder/all/geocoder.rbi
#
# geocoder-1.8.3

module Geocoder
  def self.address(query, options = nil); end
  def self.config; end
  def self.config_for_lookup(lookup_name); end
  def self.configure(options = nil, &block); end
  def self.coordinates(address, options = nil); end
  def self.log(level, message); end
  def self.merge_into_lookup_config(lookup_name, options); end
  def self.search(query, options = nil); end
end
class Geocoder::ConfigurationHash < Hash
  def method_missing(meth, *args, &block); end
  def respond_to_missing?(meth, include_private = nil); end
end
module Geocoder::Util
  def self.recursive_hash_merge(h1, h2); end
end
class Geocoder::Configuration
  def always_raise; end
  def always_raise=(value); end
  def api_key; end
  def api_key=(value); end
  def basic_auth; end
  def basic_auth=(value); end
  def cache; end
  def cache=(value); end
  def cache_options; end
  def cache_options=(value); end
  def configure(options); end
  def data; end
  def data=(arg0); end
  def distances; end
  def distances=(value); end
  def host; end
  def host=(value); end
  def http_headers; end
  def http_headers=(value); end
  def http_proxy; end
  def http_proxy=(value); end
  def https_proxy; end
  def https_proxy=(value); end
  def initialize; end
  def ip_lookup; end
  def ip_lookup=(value); end
  def kernel_logger_level; end
  def kernel_logger_level=(value); end
  def language; end
  def language=(value); end
  def logger; end
  def logger=(value); end
  def lookup; end
  def lookup=(value); end
  def self.allocate; end
  def self.always_raise; end
  def self.always_raise=(value); end
  def self.api_key; end
  def self.api_key=(value); end
  def self.basic_auth; end
  def self.basic_auth=(value); end
  def self.cache; end
  def self.cache=(value); end
  def self.cache_options; end
  def self.cache_options=(value); end
  def self.distances; end
  def self.distances=(value); end
  def self.host; end
  def self.host=(value); end
  def self.http_headers; end
  def self.http_headers=(value); end
  def self.http_proxy; end
  def self.http_proxy=(value); end
  def self.https_proxy; end
  def self.https_proxy=(value); end
  def self.initialize; end
  def self.ip_lookup; end
  def self.ip_lookup=(value); end
  def self.kernel_logger_level; end
  def self.kernel_logger_level=(value); end
  def self.language; end
  def self.language=(value); end
  def self.logger; end
  def self.logger=(value); end
  def self.lookup; end
  def self.lookup=(value); end
  def self.new(*, **); end
  def self.set_defaults; end
  def self.timeout; end
  def self.timeout=(value); end
  def self.units; end
  def self.units=(value); end
  def self.use_https; end
  def self.use_https=(value); end
  def set_defaults; end
  def timeout; end
  def timeout=(value); end
  def units; end
  def units=(value); end
  def use_https; end
  def use_https=(value); end
  extend Singleton::SingletonClassMethods
  include Singleton
end
class Geocoder::Logger
  def current_logger; end
  def log(level, message); end
  def self.allocate; end
  def self.new(*, **); end
  def valid_level?(level); end
  extend Singleton::SingletonClassMethods
  include Singleton
end
class Geocoder::KernelLogger
  def add(level, message); end
  def log_message_at_level?(level); end
  def self.allocate; end
  def self.new(*, **); end
  extend Singleton::SingletonClassMethods
  include Singleton
end
class Geocoder::Query
  def blank?; end
  def coordinates; end
  def coordinates?; end
  def execute; end
  def initialize(text, options = nil); end
  def internal_ip_address?; end
  def ip_address?; end
  def language; end
  def lookup; end
  def loopback_ip_address?; end
  def options; end
  def options=(arg0); end
  def params_given?; end
  def private_ip_address?; end
  def reverse_geocode?; end
  def sanitized_text; end
  def text; end
  def text=(arg0); end
  def to_s; end
  def url; end
end
module Geocoder::Calculations
  def bearing_between(point1, point2, options = nil); end
  def bounding_box(point, radius, options = nil); end
  def compass_point(bearing, points = nil); end
  def coordinates_present?(*args); end
  def distance_between(point1, point2, options = nil); end
  def distance_to_radians(distance, units = nil); end
  def earth_radius(units = nil); end
  def endpoint(start, heading, distance, options = nil); end
  def extract_coordinates(point); end
  def geographic_center(points); end
  def km_in_mi; end
  def km_in_nm; end
  def latitude_degree_distance(units = nil); end
  def longitude_degree_distance(latitude, units = nil); end
  def mi_in_km; end
  def nm_in_km; end
  def radians_to_distance(radians, units = nil); end
  def random_point_near(center, radius, options = nil); end
  def to_degrees(*args); end
  def to_kilometers(mi); end
  def to_miles(km); end
  def to_nautical_miles(km); end
  def to_radians(*args); end
  extend Geocoder::Calculations
end
class Geocoder::Error < StandardError
end
class Geocoder::ConfigurationError < Geocoder::Error
end
class Geocoder::OverQueryLimitError < Geocoder::Error
end
class Geocoder::ResponseParseError < Geocoder::Error
  def initialize(response); end
  def response; end
end
class Geocoder::RequestDenied < Geocoder::Error
end
class Geocoder::InvalidRequest < Geocoder::Error
end
class Geocoder::InvalidApiKey < Geocoder::Error
end
class Geocoder::ServiceUnavailable < Geocoder::Error
end
class Geocoder::LookupTimeout < Timeout::Error
end
class Geocoder::NetworkError < Geocoder::Error
end
module Geocoder::CacheStore
end
class Geocoder::CacheStore::Base
  def config; end
  def initialize(store, options); end
  def key_for(url); end
  def keys; end
  def prefix; end
  def store; end
  def urls; end
end
class Geocoder::CacheStore::Generic < Geocoder::CacheStore::Base
  def keys; end
  def read(url); end
  def remove(key); end
  def write(url, value); end
end
class Geocoder::CacheStore::Redis < Geocoder::CacheStore::Base
  def expire; end
  def initialize(store, options); end
  def keys; end
  def read(url); end
  def remove(key); end
  def write(url, value, expire = nil); end
end
class Geocoder::Cache
  def [](url); end
  def []=(url, value); end
  def expire(url); end
  def expire_single_url(url); end
  def initialize(store, config); end
  def interpret(value); end
  def keys; end
  def store_service; end
  def urls; end
end
module Geocoder::Request
  def geocoder_reject_non_ipv4_addresses(ip_addresses); end
  def geocoder_reject_trusted_ip_addresses(ip_addresses); end
  def geocoder_remove_port_from_addresses(ip_addresses); end
  def geocoder_split_ip_addresses(ip_addresses); end
  def geocoder_spoofable_ip; end
  def location; end
  def safe_location; end
end
class ActionDispatch::Request
  include Geocoder::Request
end
class Rack::Request
  include Geocoder::Request
end
module Geocoder::Lookup
  def all_services; end
  def all_services_except_test; end
  def all_services_with_http_requests; end
  def classify_name(filename); end
  def get(name); end
  def instantiate_lookup(name); end
  def ip_services; end
  def ip_services=(arg0); end
  def spawn(name); end
  def street_services; end
  def street_services=(arg0); end
  extend Geocoder::Lookup
end
class Geocoder::Lookup::Base
  def base_query_url(query); end
  def cache; end
  def cache_key(query); end
  def cache_key_params(query); end
  def check_api_key_configuration!(query); end
  def check_response_for_errors!(response); end
  def configuration; end
  def configure_ssl!(client); end
  def fetch_data(query); end
  def fetch_raw_data(query); end
  def handle; end
  def hash_to_query(hash); end
  def http_client; end
  def initialize; end
  def make_api_request(query); end
  def map_link_url(coordinates); end
  def name; end
  def parse_json(data); end
  def parse_raw_data(raw_data); end
  def protocol; end
  def query_url(query); end
  def query_url_params(query); end
  def raise_error(error, message = nil); end
  def required_api_key_parts; end
  def result_class; end
  def results(query); end
  def search(query, options = nil); end
  def supported_protocols; end
  def url_query_string(query); end
  def use_ssl?; end
  def valid_response?(response); end
end
module Geocoder::Result
end
class Geocoder::Result::Base
  def address(format = nil); end
  def cache_hit; end
  def cache_hit=(arg0); end
  def coordinates; end
  def country; end
  def country_code; end
  def data; end
  def data=(arg0); end
  def initialize(data); end
  def latitude; end
  def longitude; end
  def province; end
  def province_code; end
  def state; end
  def state_code; end
end
class Geocoder::Result::Test < Geocoder::Result::Base
  def address; end
  def city; end
  def coordinates; end
  def country; end
  def country_code; end
  def geometry; end
  def initialize(data); end
  def neighborhood; end
  def postal_code; end
  def province; end
  def province_code; end
  def route; end
  def self.add_result_attribute(attr); end
  def state; end
  def state_code; end
  def street_address; end
  def street_number; end
  def sub_state; end
  def sub_state_code; end
end
class Geocoder::Lookup::Test < Geocoder::Lookup::Base
  def name; end
  def results(query); end
  def self.add_stub(query_text, results); end
  def self.delete_stub(query_text); end
  def self.read_stub(query_text); end
  def self.reset; end
  def self.set_default_stub(results); end
  def self.stubs; end
end
class Geocoder::IpAddress < String
  def initialize(ip); end
  def internal?; end
  def loopback?; end
  def private?; end
  def valid?; end
end
module Geocoder::Model
end
module Geocoder::Model::Base
  def geocoded_by; end
  def geocoder_init(options); end
  def geocoder_options; end
  def reverse_geocoded_by; end
end
module Geocoder::Model::ActiveRecord
  def geocoded_by(address_attr, options = nil, &block); end
  def geocoder_file_name; end
  def geocoder_module_name; end
  def reverse_geocoded_by(latitude_attr, longitude_attr, options = nil, &block); end
  include Geocoder::Model::Base
end
class Geocoder::Railtie < Rails::Railtie
  def self.insert; end
end
