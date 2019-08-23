# frozen_string_literal: true

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
  before_action :change_path, only: :new
  before_action :set_pledge, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @pledge = Pledge.new
  end

  def review
    @pledge = Pledge.find(params[:id])
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

  def edit; end

  def update
    @pledge.update_attributes(pledge_params)
    if @pledge.save
      redirect_to pledge_path(@pledge)
    else
      render :edit
    end
  end

  def confirmation; end

  def destroy
    @pledge.destroy
    redirect_to '/', notice: 'Your pledge was deleted.'
  end

  private

  def set_pledge
    @pledge = Pledge.find(current_user.pledge.id)
  end

  def change_path
    if user_signed_in? && current_user.pledge.present?
      redirect_to pledge_path(@pledge)
    end
  end

  # def redirect_to_login
  #   if !user_signed_in?
  #     session["user_return_to"] = new_pledge_path
  #     redirect_to new_user_registration_path
  #   end
  # end

  def pledge_params
    params.require(:pledge).permit %i[user_id amount divisor pay_this
                                      plan]
  end
end
