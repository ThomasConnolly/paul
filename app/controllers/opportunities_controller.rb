# typed: false
# frozen_string_literal: true

class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.order(:ministry)
  end

  def show; end

  def new
    @users = User.order(:last_name)
    @opportunity = Opportunity.new
  end

  def edit
    @users = User.order(:last_name)
    @opportunity = Opportunity.find(params[:id])
  end

  def create
    if @opportunity.save
      redirect_to(@opportunities)
    else
      render(:new)
    end
  end

  def update
    @opportunity = Opportunity.find(params[:id])
    if @opportunity.update(opportunity_params)
      redirect_to(opportunities_path, notice: 'Successfully updated.')
    else
      render(:new)
    end
  end

  def destroy
    @opportunity = Opportunity.find(params[:id])
    @opportunity.destroy
    redirect_to(opportunities_path, status: :see_other,
                                    notice: 'Entry successfully destroyed.')
  end

  private

  def opportunity_params
    params.require(opportunity: %i[ministry who what when where user_id
                                   submit])
  end
end
