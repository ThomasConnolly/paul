class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @users, notice: "User created"
      else
        render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Restricted page"
  end
 end
end