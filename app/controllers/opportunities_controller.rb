# == Schema Information
#
# Table name: opportunities
#
#  id         :integer          not null, primary key
#  ministry   :string(255)
#  who        :string(255)
#  what       :string(255)
#  when       :string(255)
#  where      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class OpportunitiesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_opportunity, only: [:show, :edit, :update, :destroy]
   
  def index
    @opportunities = Opportunity.all.order(:ministry)
  end

  def show
  end

  def edit
  end

  def new
    @users = User.all.order(:last_name)
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    if @opportunity.save
      redirect_to @opportunity
    else
      render :new
    end
  end

  def update
    if @opportunity.update(opportunity_params)
      redirect_to @opportunity
    else
      render :new
    end
  end

  def destroy
    @opportunity.destroy
      redirect_to opportunity_url, notice: 'Entry successfully destroyed.'
  end




  private

  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  def opportunity_params
    params.require(:opportunity).permit(:user_id, :ministry, :who, 
      :what, :when, :where, :id)
  end
end
