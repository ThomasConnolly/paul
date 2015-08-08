module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_id << :email
    devise_parameter_sanitizer.for(:sign_in) << :full_name << :avatar
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :email << :avatar
  end

end

DeviseController.send :include, DevisePermittedParameters
