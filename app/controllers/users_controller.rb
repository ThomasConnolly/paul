class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only

  def index
    @users = User.all.order(:last_name)
  end
  
  
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
  end

end
