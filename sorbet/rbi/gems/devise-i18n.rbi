# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/devise-i18n/all/devise-i18n.rbi
#
# devise-i18n-1.12.1

module DeviseI18n
  def self.railtie_helpers_paths; end
  def self.railtie_namespace; end
  def self.railtie_routes_url_helpers(include_path_helpers = nil); end
  def self.table_name_prefix; end
  def self.use_relative_model_naming?; end
end
module DeviseI18n::ViewHelpers
  def devise_i18n_fix_model_name_case(text, i18n_key:); end
end
class DeviseI18n::Engine < Rails::Engine
end
class DeviseI18n::Railtie < Rails::Railtie
  def self.add(pattern); end
  def self.pattern_from(args); end
end
