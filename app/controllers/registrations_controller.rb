# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name personal])
  end
end
