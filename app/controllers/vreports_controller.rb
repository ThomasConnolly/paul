# == Schema Information
#
# Table name: vreports
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VreportsController < ApplicationController
  before_action :authenticate_user!
  before_action :vestry_only
  before_action :set_vreport, only: [:show, :edit, :update, :destroy]
  before_action :all_vreports, only: [:index, :create, :update, :destroy]
  
  respond_to :html, :js

  def new
    @vreport = Vreport.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @vreports = Vreport.includes(:comments).all
    @vreport = Vreport.new
  end

  def show
  end
  
  def create
    @vreport = current_user.vreports.build(vreport_params)
      if @vreport.save
        VestryMailer.vreport_created(@vreport).deliver_now
        respond_to do |format|
          format.html { redirect_to vreports_path(@vreport) }
          format.js
      end
    end
  end
   

  def update
    @vreport.update_attributes(vreport_params)
      @vreport.save
      respond_to do |format|
      format.html { redirect_to vreports_path }
      format.js
    end 
  end

  def edit
  end


  def destroy
    @vreport.destroy
  end





private

  def all_vreports
    @vreports = Vreport.all
  end

  def set_vreport
    @vreport = Vreport.find(params[:id])
  end

  def vreport_params
    params.require(:vreport).permit(:body, :title, :comments)
  end

  def vestry_only
    unless current_user.vestry? or current_user.admin?
      redirect_to root_path, :alert => "You must be a member of the St. Paul Vestry to use this function."
    end
  end
end
