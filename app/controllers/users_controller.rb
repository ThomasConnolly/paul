
class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :set_user, only: [:show, :edit, :update]
  
  def new  
    @user = User.new
  end

  def index
    @users = User.all.order(:last_name)
    unless current_user.admin?
      redirect_to '/'
    end
  end
    
  def show
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(current_user.profile)
    end
  end

  def edit
  end
  
   

private

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :full_name, :role, :avatar, :stripe_customer_id)
  end
end
