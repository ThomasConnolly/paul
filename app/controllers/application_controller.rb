class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  after_filter :store_location
  before_action :configure_permitted_parameters, if: :devise_controller?
  
    
  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    root_path  
  end

  def after_sign_up_path_for(resource)
    root_path
  end
   


protected
  
  def configure_permitted_parameters
    
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:full_name, :remember_me, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  end

end
