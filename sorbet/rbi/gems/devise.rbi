# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/devise/all/devise.rbi
#
# devise-4.9.4

module Devise
  def allow_unconfirmed_access_for; end
  def allow_unconfirmed_access_for=(val); end
  def authentication_keys; end
  def authentication_keys=(val); end
  def case_insensitive_keys; end
  def case_insensitive_keys=(val); end
  def clean_up_csrf_token_on_authentication; end
  def clean_up_csrf_token_on_authentication=(val); end
  def confirm_within; end
  def confirm_within=(val); end
  def confirmation_keys; end
  def confirmation_keys=(val); end
  def default_scope; end
  def default_scope=(val); end
  def email_regexp; end
  def email_regexp=(val); end
  def expire_all_remember_me_on_sign_out; end
  def expire_all_remember_me_on_sign_out=(val); end
  def extend_remember_period; end
  def extend_remember_period=(val); end
  def helpers; end
  def http_authenticatable; end
  def http_authenticatable=(val); end
  def http_authenticatable_on_xhr; end
  def http_authenticatable_on_xhr=(val); end
  def http_authentication_key; end
  def http_authentication_key=(val); end
  def http_authentication_realm; end
  def http_authentication_realm=(val); end
  def last_attempt_warning; end
  def last_attempt_warning=(val); end
  def lock_strategy; end
  def lock_strategy=(val); end
  def mailer_sender; end
  def mailer_sender=(val); end
  def mappings; end
  def maximum_attempts; end
  def maximum_attempts=(val); end
  def navigational_formats; end
  def navigational_formats=(val); end
  def omniauth_configs; end
  def omniauth_path_prefix; end
  def omniauth_path_prefix=(val); end
  def params_authenticatable; end
  def params_authenticatable=(val); end
  def paranoid; end
  def paranoid=(val); end
  def parent_controller; end
  def parent_controller=(val); end
  def parent_mailer; end
  def parent_mailer=(val); end
  def password_length; end
  def password_length=(val); end
  def pepper; end
  def pepper=(val); end
  def reconfirmable; end
  def reconfirmable=(val); end
  def reload_routes; end
  def reload_routes=(val); end
  def remember_for; end
  def remember_for=(val); end
  def rememberable_options; end
  def rememberable_options=(val); end
  def request_keys; end
  def request_keys=(val); end
  def reset_password_keys; end
  def reset_password_keys=(val); end
  def reset_password_within; end
  def reset_password_within=(val); end
  def responder; end
  def responder=(val); end
  def router_name; end
  def router_name=(val); end
  def scoped_views; end
  def scoped_views=(val); end
  def secret_key; end
  def secret_key=(val); end
  def self.activerecord51?; end
  def self.add_mapping(resource, options); end
  def self.add_module(module_name, options = nil); end
  def self.allow_unconfirmed_access_for; end
  def self.allow_unconfirmed_access_for=(val); end
  def self.authentication_keys; end
  def self.authentication_keys=(val); end
  def self.available_router_name; end
  def self.case_insensitive_keys; end
  def self.case_insensitive_keys=(val); end
  def self.clean_up_csrf_token_on_authentication; end
  def self.clean_up_csrf_token_on_authentication=(val); end
  def self.configure_warden!; end
  def self.confirm_within; end
  def self.confirm_within=(val); end
  def self.confirmation_keys; end
  def self.confirmation_keys=(val); end
  def self.default_scope; end
  def self.default_scope=(val); end
  def self.deprecator; end
  def self.email_regexp; end
  def self.email_regexp=(val); end
  def self.expire_all_remember_me_on_sign_out; end
  def self.expire_all_remember_me_on_sign_out=(val); end
  def self.extend_remember_period; end
  def self.extend_remember_period=(val); end
  def self.friendly_token(length = nil); end
  def self.helpers; end
  def self.http_authenticatable; end
  def self.http_authenticatable=(val); end
  def self.http_authenticatable_on_xhr; end
  def self.http_authenticatable_on_xhr=(val); end
  def self.http_authentication_key; end
  def self.http_authentication_key=(val); end
  def self.http_authentication_realm; end
  def self.http_authentication_realm=(val); end
  def self.include_helpers(scope); end
  def self.last_attempt_warning; end
  def self.last_attempt_warning=(val); end
  def self.lock_strategy; end
  def self.lock_strategy=(val); end
  def self.mailer; end
  def self.mailer=(class_name); end
  def self.mailer_sender; end
  def self.mailer_sender=(val); end
  def self.mappings; end
  def self.maximum_attempts; end
  def self.maximum_attempts=(val); end
  def self.navigational_formats; end
  def self.navigational_formats=(val); end
  def self.omniauth(provider, *args); end
  def self.omniauth_configs; end
  def self.omniauth_path_prefix; end
  def self.omniauth_path_prefix=(val); end
  def self.omniauth_providers; end
  def self.params_authenticatable; end
  def self.params_authenticatable=(val); end
  def self.paranoid; end
  def self.paranoid=(val); end
  def self.parent_controller; end
  def self.parent_controller=(val); end
  def self.parent_mailer; end
  def self.parent_mailer=(val); end
  def self.password_length; end
  def self.password_length=(val); end
  def self.pepper; end
  def self.pepper=(val); end
  def self.reconfirmable; end
  def self.reconfirmable=(val); end
  def self.ref(arg); end
  def self.regenerate_helpers!; end
  def self.reload_routes; end
  def self.reload_routes=(val); end
  def self.remember_for; end
  def self.remember_for=(val); end
  def self.rememberable_options; end
  def self.rememberable_options=(val); end
  def self.request_keys; end
  def self.request_keys=(val); end
  def self.reset_password_keys; end
  def self.reset_password_keys=(val); end
  def self.reset_password_within; end
  def self.reset_password_within=(val); end
  def self.responder; end
  def self.responder=(val); end
  def self.router_name; end
  def self.router_name=(val); end
  def self.scoped_views; end
  def self.scoped_views=(val); end
  def self.secret_key; end
  def self.secret_key=(val); end
  def self.secure_compare(a, b); end
  def self.send_email_changed_notification; end
  def self.send_email_changed_notification=(val); end
  def self.send_password_change_notification; end
  def self.send_password_change_notification=(val); end
  def self.setup; end
  def self.sign_in_after_change_password; end
  def self.sign_in_after_change_password=(val); end
  def self.sign_in_after_reset_password; end
  def self.sign_in_after_reset_password=(val); end
  def self.sign_out_all_scopes; end
  def self.sign_out_all_scopes=(val); end
  def self.sign_out_via; end
  def self.sign_out_via=(val); end
  def self.skip_session_storage; end
  def self.skip_session_storage=(val); end
  def self.stretches; end
  def self.stretches=(val); end
  def self.strip_whitespace_keys; end
  def self.strip_whitespace_keys=(val); end
  def self.timeout_in; end
  def self.timeout_in=(val); end
  def self.token_generator; end
  def self.token_generator=(val); end
  def self.unlock_in; end
  def self.unlock_in=(val); end
  def self.unlock_keys; end
  def self.unlock_keys=(val); end
  def self.unlock_strategy; end
  def self.unlock_strategy=(val); end
  def self.warden(&block); end
  def self.warden_config; end
  def self.warden_config=(val); end
  def send_email_changed_notification; end
  def send_email_changed_notification=(val); end
  def send_password_change_notification; end
  def send_password_change_notification=(val); end
  def sign_in_after_change_password; end
  def sign_in_after_change_password=(val); end
  def sign_in_after_reset_password; end
  def sign_in_after_reset_password=(val); end
  def sign_out_all_scopes; end
  def sign_out_all_scopes=(val); end
  def sign_out_via; end
  def sign_out_via=(val); end
  def skip_session_storage; end
  def skip_session_storage=(val); end
  def stretches; end
  def stretches=(val); end
  def strip_whitespace_keys; end
  def strip_whitespace_keys=(val); end
  def timeout_in; end
  def timeout_in=(val); end
  def token_generator; end
  def token_generator=(val); end
  def unlock_in; end
  def unlock_in=(val); end
  def unlock_keys; end
  def unlock_keys=(val); end
  def unlock_strategy; end
  def unlock_strategy=(val); end
  def warden_config; end
  def warden_config=(val); end
end
module Devise::Controllers
end
class Devise::Controllers::Responder < ActionController::Responder
  def self.error_status; end
  def self.redirect_status; end
end
module Devise::Controllers::SignInOut
  def bypass_sign_in(resource, scope: nil); end
  def expire_data_after_sign_in!; end
  def expire_data_after_sign_out!; end
  def sign_in(resource_or_scope, *args); end
  def sign_out(resource_or_scope = nil); end
  def sign_out_all_scopes(lock = nil); end
  def signed_in?(scope = nil); end
end
module Devise::Controllers::StoreLocation
  def add_fragment_back_to_path(uri, path); end
  def extract_path_from_location(location); end
  def parse_uri(location); end
  def remove_domain_from_uri(uri); end
  def store_location_for(resource_or_scope, location); end
  def stored_location_for(resource_or_scope); end
  def stored_location_key_for(resource_or_scope); end
end
module Devise::Controllers::Helpers
  def after_sign_in_path_for(resource_or_scope); end
  def after_sign_out_path_for(resource_or_scope); end
  def allow_params_authentication!; end
  def devise_controller?; end
  def devise_parameter_sanitizer; end
  def expire_data_after_sign_out!; end
  def handle_unverified_request; end
  def is_flashing_format?; end
  def is_navigational_format?; end
  def request_format; end
  def self.define_helpers(mapping); end
  def sign_in_and_redirect(resource_or_scope, *args); end
  def sign_out_and_redirect(resource_or_scope); end
  def signed_in_root_path(resource_or_scope); end
  def warden; end
  extend ActiveSupport::Concern
  include Devise::Controllers::SignInOut
  include Devise::Controllers::StoreLocation
end
module Devise::Controllers::Helpers::ClassMethods
  def devise_group(group_name, opts = nil); end
  def log_process_action(payload); end
end
class Devise::MissingWarden < StandardError
  def initialize; end
end
class Devise::Mapping
  def authenticatable?; end
  def class_name; end
  def confirmable?; end
  def controllers; end
  def database_authenticatable?; end
  def default_constraints(options); end
  def default_controllers(options); end
  def default_defaults(options); end
  def default_failure_app(options); end
  def default_path_names(options); end
  def default_used_helpers(options); end
  def default_used_route(options); end
  def failure_app; end
  def format; end
  def fullpath; end
  def initialize(name, options); end
  def lockable?; end
  def modules; end
  def name; end
  def no_input_strategies; end
  def omniauthable?; end
  def path; end
  def path_names; end
  def recoverable?; end
  def registerable?; end
  def rememberable?; end
  def router_name; end
  def routes; end
  def scoped_path; end
  def self.add_module(m); end
  def self.find_by_path!(path, path_type = nil); end
  def self.find_scope!(obj); end
  def sign_out_via; end
  def singular; end
  def strategies; end
  def timeoutable?; end
  def to; end
  def trackable?; end
  def used_helpers; end
  def used_routes; end
  def validatable?; end
end
module Devise::Models
  def devise(*modules); end
  def devise_modules_hook!; end
  def self.check_fields!(klass); end
  def self.config(mod, *accessors); end
end
module Devise::Models::Authenticatable
  def active_for_authentication?; end
  def apply_to_attribute_or_variable(attr, method); end
  def authenticatable_salt; end
  def devise_mailer; end
  def downcase_keys; end
  def inactive_message; end
  def inspect; end
  def self.required_fields(klass); end
  def send_devise_notification(notification, *args); end
  def serializable_hash(options = nil); end
  def strip_whitespace; end
  def unauthenticated_message; end
  def valid_for_authentication?; end
  extend ActiveSupport::Concern
  include ActiveSupport::Deprecation::DeprecatedConstantAccessor
end
module Devise::Models::Authenticatable::ClassMethods
  def authentication_keys; end
  def authentication_keys=(value); end
  def case_insensitive_keys; end
  def case_insensitive_keys=(value); end
  def devise_parameter_filter; end
  def find_first_by_auth_conditions(tainted_conditions, opts = nil); end
  def find_for_authentication(tainted_conditions); end
  def find_or_initialize_with_error_by(attribute, value, error = nil); end
  def find_or_initialize_with_errors(required_attributes, attributes, error = nil); end
  def http_authenticatable; end
  def http_authenticatable=(value); end
  def http_authenticatable?(strategy); end
  def http_authentication_key; end
  def http_authentication_key=(value); end
  def params_authenticatable; end
  def params_authenticatable=(value); end
  def params_authenticatable?(strategy); end
  def request_keys; end
  def request_keys=(value); end
  def self.available_configs; end
  def self.available_configs=(arg0); end
  def serialize_from_session(key, salt); end
  def serialize_into_session(record); end
  def skip_session_storage; end
  def skip_session_storage=(value); end
  def strip_whitespace_keys; end
  def strip_whitespace_keys=(value); end
end
class Devise::Models::MissingAttribute < StandardError
  def initialize(attributes); end
  def message; end
end
module Devise::RouteSet
  def finalize!; end
end
module ActionDispatch::Routing
end
class ActionDispatch::Routing::RouteSet
end
class ActionDispatch::Routing::Mapper
  def as(scope); end
  def authenticate(scope = nil, block = nil); end
  def authenticated(scope = nil, block = nil); end
  def constraints_for(method_to_apply, scope = nil, block = nil); end
  def devise_confirmation(mapping, controllers); end
  def devise_for(*resources); end
  def devise_omniauth_callback(mapping, controllers); end
  def devise_password(mapping, controllers); end
  def devise_registration(mapping, controllers); end
  def devise_scope(scope); end
  def devise_session(mapping, controllers); end
  def devise_unlock(mapping, controllers); end
  def raise_no_devise_method_error!(klass); end
  def raise_no_secret_key; end
  def set_omniauth_path_prefix!(path_prefix); end
  def unauthenticated(scope = nil); end
  def with_devise_exclusive_scope(new_path, new_as, options); end
end
module Warden::Mixins::Common
  def cookies; end
end
class Devise::Engine < Rails::Engine
end
module Devise::Hooks
end
module Devise::Mailers
end
module Devise::Strategies
end
module Devise::Test
end
class Devise::Getter
  def get; end
  def initialize(name); end
end
class ActiveRecord::Base
  extend Devise::Models
end
class Devise::TokenGenerator
end
class Devise::FailureApp < ActionController::Metal
  extend AbstractController::Callbacks::ClassMethods
  extend AbstractController::UrlFor::ClassMethods
  extend ActiveSupport::Callbacks::ClassMethods
  extend ActiveSupport::DescendantsTracker
  include AbstractController::Callbacks
  include AbstractController::Logger
  include AbstractController::UrlFor
  include ActionController::Redirecting
  include ActionController::UrlFor
  include ActionController::UrlFor
  include ActionDispatch::Routing::RouteSet::MountedHelpers
  include ActionDispatch::Routing::UrlFor
  include ActionDispatch::Routing::UrlFor
  include ActionDispatch::Routing::UrlFor
  include ActiveSupport::Benchmarkable
  include ActiveSupport::Callbacks
  include Anonymous_Module_30
  include Devise::Controllers::StoreLocation
end
module Devise::Orm
end
module Devise::Orm::DirtyTrackingNewMethods
end
module Devise::Orm::DirtyTrackingOldMethods
end
class Devise::Strategies::Base < Warden::Strategies::Base
end
class Devise::Strategies::Authenticatable < Devise::Strategies::Base
end
class Devise::Strategies::DatabaseAuthenticatable < Devise::Strategies::Authenticatable
end
module Devise::Models::DatabaseAuthenticatable
  extend ActiveSupport::Concern
end
module Devise::Models::DatabaseAuthenticatable::ClassMethods
end
class Devise::Strategies::Rememberable < Devise::Strategies::Authenticatable
end
module Devise::Models::Rememberable
  extend ActiveSupport::Concern
end
module Devise::Models::Rememberable::ClassMethods
end
module Devise::Models::Recoverable
  extend ActiveSupport::Concern
end
module Devise::Models::Recoverable::ClassMethods
end
module Devise::Models::Registerable
  extend ActiveSupport::Concern
end
module Devise::Models::Registerable::ClassMethods
end
module Devise::Models::Confirmable
  extend ActiveSupport::Concern
end
module Devise::Models::Confirmable::ClassMethods
end
module Devise::Models::Trackable
end
class Devise::Delegator
end
module Devise::Controllers::UrlHelpers
end
module DeviseHelper
end
module Devise::Controllers::ScopedViews
  extend ActiveSupport::Concern
end
module Devise::Controllers::ScopedViews::ClassMethods
end
class DeviseController < ApplicationController
  extend Devise::Controllers::ScopedViews::ClassMethods
  include Anonymous_Module_30
  include Devise::Controllers::ScopedViews
end
module DeviseController::HelperMethods
  include ApplicationController::HelperMethods
end
class Devise::RegistrationsController < DeviseController
  include Anonymous_Module_30
end
class Devise::SessionsController < DeviseController
  include Anonymous_Module_30
end
module Devise::Mailers::Helpers
  extend ActiveSupport::Concern
end
class Devise::Mailer < ActionMailer::Base
  extend Devise::Controllers::ScopedViews::ClassMethods
  include ActionDispatch::Routing::UrlFor
  include Anonymous_Module_91
  include Devise::Controllers::ScopedViews
  include Devise::Mailers::Helpers
end
class Devise::ConfirmationsController < DeviseController
  include Anonymous_Module_30
end
class Devise::OmniauthCallbacksController < DeviseController
  include Anonymous_Module_30
end
class Devise::PasswordsController < DeviseController
  include Anonymous_Module_30
end
class Devise::UnlocksController < DeviseController
  include Anonymous_Module_30
end
