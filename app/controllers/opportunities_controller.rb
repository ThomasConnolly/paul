# frozen_string_literal: true

class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[show edit update destroy]

  def index
    @opportunities = Opportunity.all.order(:ministry)
  end

  def show; end

  def edit; end

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
    redirect_to opportunities_path, status: :see_other, notice: 'Entry successfully destroyed.'
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
