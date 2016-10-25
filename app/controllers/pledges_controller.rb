# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :integer
#  divisor    :integer
#  pay_this   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PledgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pledge, only: [:show, :edit, :update, :destroy]
  before_action :change_pledge, only: :new
  

  def show
  end
  
  def edit

  end

 def update

    @pledge.update_attributes(pledge_params)
    if  @pledge.save
        redirect_to pledge_path(@pledge)
    else
        render 'edit'
    end 
  end

  def destroy
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id if current_user
    if @pledge.save
      redirect_to pledge_path(@pledge)
    else
      render :new
    end   
  end


private

  def set_pledge
    @pledge = Pledge.find(current_user.pledge(params[:id]))
  end

  def change_pledge
    if current_user.pledge.present?
      redirect_to edit_pledge_path(current_user.pledge(params[:id]))
    end
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
