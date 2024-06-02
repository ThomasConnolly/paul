# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/recaptcha/all/recaptcha.rbi
#
# recaptcha-5.16.0

module Recaptcha
  def self.action_valid?(action, expected_action); end
  def self.api_verification_enterprise(query_params, body, project_id, timeout: nil); end
  def self.api_verification_free(verify_hash, timeout: nil, json: nil); end
  def self.configuration; end
  def self.configure; end
  def self.hostname_valid?(hostname, validation); end
  def self.http_client_for(uri:, timeout: nil); end
  def self.invalid_response?(resp); end
  def self.score_above_threshold?(score, minimum_score); end
  def self.score_below_threshold?(score, maximum_score); end
  def self.skip_env?(env); end
  def self.verify_via_api_call(response, options); end
  def self.verify_via_api_call_enterprise(response, options); end
  def self.verify_via_api_call_free(response, options); end
  def self.with_configuration(config); end
end
class Recaptcha::Configuration
  def api_server_url; end
  def api_server_url=(arg0); end
  def default_env; end
  def default_env=(arg0); end
  def enterprise; end
  def enterprise=(arg0); end
  def enterprise_api_key!; end
  def enterprise_api_key; end
  def enterprise_api_key=(arg0); end
  def enterprise_project_id!; end
  def enterprise_project_id; end
  def enterprise_project_id=(arg0); end
  def handle_timeouts_gracefully; end
  def handle_timeouts_gracefully=(arg0); end
  def hostname; end
  def hostname=(arg0); end
  def initialize; end
  def proxy; end
  def proxy=(arg0); end
  def response_limit; end
  def response_limit=(arg0); end
  def secret_key!; end
  def secret_key; end
  def secret_key=(arg0); end
  def site_key!; end
  def site_key; end
  def site_key=(arg0); end
  def skip_verify_env; end
  def skip_verify_env=(arg0); end
  def verify_url; end
  def verify_url=(arg0); end
end
module Recaptcha::Helpers
  def self.components(options); end
  def self.dasherize_action(action); end
  def self.default_callback(options = nil); end
  def self.default_callback_required?(options); end
  def self.element_check_condition(options); end
  def self.hash_to_query(hash); end
  def self.invisible_recaptcha_tags(custom); end
  def self.recaptcha_execute_method_name; end
  def self.recaptcha_ready_method_name; end
  def self.recaptcha_tags(options); end
  def self.recaptcha_v3(options = nil); end
  def self.recaptcha_v3_async_execute_function_name(action); end
  def self.recaptcha_v3_default_callback_name(action); end
  def self.recaptcha_v3_define_default_callback(callback, options); end
  def self.recaptcha_v3_define_default_callback?(callback, action, options); end
  def self.recaptcha_v3_execute_function_name(action); end
  def self.recaptcha_v3_inline_script(site_key, action, callback, id, options = nil); end
  def self.recaptcha_v3_inline_script?(options); end
  def self.recaptcha_v3_onload_script(site_key, action, callback, id, options = nil); end
  def self.sanitize_action_for_js(action); end
  def self.to_error_message(key); end
  def self.to_message(key, default); end
end
module Recaptcha::Adapters
end
module Recaptcha::Adapters::ControllerMethods
  def recaptcha_error(model, attribute, message); end
  def recaptcha_flash_supported?; end
  def recaptcha_reply; end
  def recaptcha_response_token(action = nil); end
  def verify_recaptcha!(options = nil); end
  def verify_recaptcha(options = nil); end
end
module Recaptcha::Adapters::ViewMethods
  def invisible_recaptcha_tags(options = nil); end
  def recaptcha_tags(options = nil); end
  def recaptcha_v3(options = nil); end
end
class Recaptcha::Railtie < Rails::Railtie
  def self.add(pattern); end
  def self.pattern_from(args); end
end
class Recaptcha::RecaptchaError < StandardError
end
class Recaptcha::VerifyError < Recaptcha::RecaptchaError
end
