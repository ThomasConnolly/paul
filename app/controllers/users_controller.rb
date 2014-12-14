class UsersController < ApplicationController
  def index
    @users = User.all.order(:last_name)
  end

  def show
    @user = User.find(params[:id])
  end


private


  def user_params
      params.require(:user).permit(:first_name, :last_name, :full_name, :avatar, :avatar_cache, :remove_avatar)
    end
end
