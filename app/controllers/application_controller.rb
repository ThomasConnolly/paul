# frozen_string_literal: true
# typed: false

require 'application_responder'
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # MODIFIED THIS LINE
    Rails.logger.debug do
      "DEBUG: In configure_permitted_parameters for #{self.class.name}, action: #{action_name}"
    end
    added_attrs = %i[first_name last_name username email
                     password password_confirmation
                     remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  # def verified_request?
  #   super ||
  #     valid_authenticity_token?(session, request.headers['X-CSRF-Token']) # ||
  #   # request.headers['X-Requested-With'] == 'Turbo-Frame'
  # end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(_resource)
    request.referer || root_path
  end
end
