# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/globalid/all/globalid.rbi
#
# globalid-1.2.1

module URI
end
class URI::GID < URI::Generic
  def app; end
  def check_host(host); end
  def check_path(path); end
  def check_scheme(scheme); end
  def deconstruct_keys(_keys); end
  def model_id; end
  def model_name; end
  def params; end
  def parse_query_params(query); end
  def query=(query); end
  def self.build(args); end
  def self.create(app, model, params = nil); end
  def self.parse(uri); end
  def self.validate_app(app); end
  def set_model_components(path, validate = nil); end
  def set_params(params); end
  def set_path(path); end
  def set_query(query); end
  def to_s; end
  def validate_component(component); end
  def validate_model_id(model_id_part); end
  def validate_model_id_section(model_id, model_name); end
end
class URI::GID::MissingModelIdError < URI::InvalidComponentError
end
class URI::GID::InvalidModelIdError < URI::InvalidComponentError
end
class GlobalID
  def ==(other); end
  def app(*, **, &); end
  def as_json(*); end
  def deconstruct_keys(*, **, &); end
  def eql?(other); end
  def find(options = nil); end
  def hash; end
  def initialize(gid, options = nil); end
  def model_class; end
  def model_id(*, **, &); end
  def model_name(*, **, &); end
  def params(*, **, &); end
  def self.app; end
  def self.app=(app); end
  def self.create(model, options = nil); end
  def self.deprecator; end
  def self.eager_load!; end
  def self.find(gid, options = nil); end
  def self.parse(gid, options = nil); end
  def self.parse_encoded_gid(gid, options); end
  def to_param; end
  def to_s(*, **, &); end
  def uri; end
  extend ActiveSupport::Autoload
end
class GlobalID::Railtie < Rails::Railtie
end
class SignedGlobalID < GlobalID
end
class SignedGlobalID::ExpiredMessage < StandardError
end
module GlobalID::Identification
end
class GlobalID::Verifier < ActiveSupport::MessageVerifier
end
