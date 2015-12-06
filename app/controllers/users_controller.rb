
class UsersController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
 before_action :set_user, only: [:show, :edit, :update]
 
  
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
  
   def update
      if @user.update_attributes(user_params)
        redirect_to profile_path(@user.profile.id)
    else
      render 'edit'
    end
  end

  def edit
  end




private
 def set_user
  @user = User.find(params[:id])
 end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :full_name, :role, :avatar, :stripe_customer_id)
  end
end
