class UsersController < ApplicationController
 before_filter do    
 redirect_to '/' unless current_user && current_user.admin?
end
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.order(:last_name)
  end
    
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(current_user.profile)
    else
      render :edit
    end
  end


private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role, :email, :password, :confirm_password, :first_name, :last_name, :full_name, :stripe_customer_id, :avatar)
  end
end

