
class UsersController < ApplicationController
 before_action :authenticate_user!
 
  
  def index
    @users = User.all.order(:last_name)
    unless current_user.admin?
      redirect_to '/'
    end
  end
    
  def show
    unless @user == current_user
      redirect_to :back, :alert => "You must be registered and signed in to use the feature you requested."
    end
  end
  
   

  


  def user_params
    params.require(:user).permit(:first_name, :last_name, :full_name, :role, :avatar, :stripe_customer_id)
  end
end
