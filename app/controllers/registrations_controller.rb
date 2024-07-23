# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    if email_deliverable?(sign_up_params[:email])
      super # Proceed with Devise's original create method
    else
      flash[:alert] = 'Cannot confirm that email address!'
      redirect_to root_path
    end
  end

  private

  def email_deliverable?(email)
    return false if email.blank?

    client = VerifaliaConfig.client
    job = client.email_validations.submit(email)
    entry = job.entries[0]

    entry.classification == 'Deliverable'
  rescue => e
    Rails.logger.error "Verifalia email validation failed: #{e.message}"
    false
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
