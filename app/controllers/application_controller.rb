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
   
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, 
      :password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
  end

end
