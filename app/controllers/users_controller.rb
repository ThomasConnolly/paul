class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all.order(:last_name)
  end
  
  
  def show
    unless @user = User.find(params[:id])
      redirect_to :back, :alert => "Access denied."
    end
  end

end
