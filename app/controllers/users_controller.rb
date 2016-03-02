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
#  full_name              :string(255)
#  role                   :integer
#  stripe_customer_id     :string
#  birthday               :date
#  anniversary            :date
#


class UsersController < ApplicationController
 
 before_action :authenticate_user!
 before_action :admin_only, only: [:index, :new, :create]
 before_action :member_only, only: [:show]
 before_action :set_user, only: [:show, :edit, :update]
 
  
  def new  
    @user = User.new
  end

 
  def index
    @users = User.all.order(:last_name)
    unless current_user.admin?
      redirect_to '/'
    @import = User::Import.new
    end
  end
    
  def import
    User.import(params[:file])
    redirect_to users_path
  end

  def show
  end

  def create
    @user = User.new(user_params)
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(current_user.profile)
    end
  end

  def edit
  end
  
   

private

  def set_user
    @user=User.find(params[:id])
  end

  def user_import_params
    params.require(:user_import).permit(:file)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :full_name, :role, :avatar, 
      :stripe_customer_id, :member_id)
  end

  def admin_only
    unless current_user.admin? 
      redirect_to root_path, :alert => "Access denied."
    end
  end
  
  def member_only
    unless current_user.admin? or current_user.vestry? or current_user.member?
      redirect_to root_path, :alert => "Access for parish members only."
    end
  end
end
