class PledgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pledge, only: [:show, :edit, :update, :destroy]

  
  def index
    @pledges = Pledge.all
  end

  def show
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

  def pledge_params
    params.require(:pledge).permit [:amount, :divisor, :pay_this]
  end
end
