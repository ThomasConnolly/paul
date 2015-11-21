class PledgesController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]
  
  def index
  end

  def show
    @pledge = Pledge.find(params[:id])
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

  def new
    @pledge = Pledge.new
    respond_to do |format|
      format.html
        
      format.js
    end
  end


  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id if current_user
      if @pledge.save
        redirect_to @pledge
      else
        render :new
      end   
  end


private



  def set_pledge
    @pledge = Pledge.find(params[:id])
  end

  def redirect_to_signup
    if !user_signed_in?
      session["user_return_to"] = new_pledge_path
      redirect_to new_user_registration_path
    end
  end

  def pledge_params
    params.require(:pledge).permit [:amount, :divisor, :pay_this]
  end
end
