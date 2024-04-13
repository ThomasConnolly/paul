# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    build_resource(sign_up_params)
    if verify_email
      super
    else
      flash[:alert] = 'Please enter a working email address.'
      render :new
    end
  rescue => e
    logger.error "Error creating user: #{e.message}"
    resource.errors.add(:base, 'There was an error creating your account. Please check your email address and try again.')
    render :new
  end

  private

  def verify_email
    job = verifalia_client.email_validations.submit(params[:user][:email])
    entry = job.entries[0]
    puts "Classification: #{entry.classification} (status: #{entry.status})"
    if entry.status == 'Completed'
      # Email validation succeeded; proceed with user creation
      true
    else
      # Email validation failed; handle the error appropriately
      resource.errors.add(:email, 'must be a real email address')
      false
    end
  end

  def verifalia_client
    @verifalia_client ||= Verifalia::Client.new(
      username: Rails.application.credentials.dig(:verifalia, :username),
      password: Rails.application.credentials.dig(:verifalia, :password)
    )
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name personal])
  end
end
