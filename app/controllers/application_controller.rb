# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def store_location
  # session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  # end

  # def after_sign_in_path_for(resource)
  # root_path
  # end

  # def after_sign_up_path_for(resource)
  # root_path
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, 
      keys: [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, 
      keys: [:login, :password, :remember_me]
    devise_parameter_sanitizer.permit :account_update, 
      keys: [:login, :first_name, :last_name, :email, :password, :password_confirmation, :current_password]
  end

  private
  def login
    @login || self.username || self.email
  end
  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(_resource)
    request.referrer || root_path
  end
end
