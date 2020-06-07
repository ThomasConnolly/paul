# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  username              :string(255)
#  role                   :integer
#  stripe_customer_id     :string
#  member_id              :integer
#

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: %i[index new create]
  before_action :member_only, only: [:show]
  before_action :set_user, only: %i[show edit update]

  def new
    @user = User.new
    @import = User::Import.new
  end

  def index
    @users = User.all.order(:last_name)
    unless current_user.has_role?(:admin)
      redirect_to '/'
      @import = User::Import.new
    end
  end

  def import
    @import = User::Import.new user_import_params
    if @import.save
      redirect_to users_path, notice:
      "Imported #{@import.imported_count} users"
    else
      @users = User.all
      flash[:alert] =
        "There were #{@import.errors.count} errors in your CSV file"
      render action: :index
    end
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
       WelcomeMailer.welcome_email(@user).deliver_now
  end

  def update
    redirect_to profile_path(current_user.profile) if @user.update(user_params)
  end

  def edit; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_import_params
    params.require(:user_import).permit(:file)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :role,
                                 :avatar, :stripe_id, :card, :card_last4, :card_exp_year, :card_exp_month,
                                 :card_type, :stripe_pledge_id, :stripe_sponsorship_id, :member_id, :id)
  end

  def admin_only
    unless current_user.has_role?(:admin)
      flash[:alert] = 'Access denied.'
      redirect_to root_path
    end
  end

  def member_only
    unless current_user.has_role?(:member)
      redirect_to root_path, alert: 'Access is restricted.'
    end
  end
end
