# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :verify_email, only: [:create]

  def new
    @user = User.new
  end

  def create
    build_resource(sign_up_params)

    #    if verify_email
    #     super
    #   else
    #     resource.errors.add(:email, 'must be a real email address')
    #     render :new
    #   end
    #   rescue => e
    #     logger.error "Error creating user: #{e.message}"
  end

  # private

  # def verify_email
  #   Rails.logger.info "Verifying_email: #{params[:user][:email]}"

  #   def verifalia_client
  #     @verifalia_client ||= Verifalia::Client.new(
  #       username: Rails.application.credentials.dig(:verifalia, :username),
  #       password: Rails.application.credentials.dig(:verifalia, :password)
  #     )
  #   end
  #   result = client.email_validations.submit(params[:user][:email])

  #   # Wait for verification to complete
  #   while result.status < Verifalia::REST::ValidationStatus::Completed
  #     sleep 1
  #     result = client.email_validations.get(result.id)
  #   end

  #   result.entries.first.is_deliverable?
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
