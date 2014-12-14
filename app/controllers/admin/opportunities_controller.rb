class Admin::OpportunitiesController < ApplicationController
  
  def new
    @user_options = User.all.order(:last_name)
    @opportunity = Opportunity.new
end

  def create
    @opportunity = Opportunity.new(opportunity_params)
      if @opportunity.save
        redirect_to @opportunity, notice: 'Opportunity was successfully created.' 
      else
        render :new 
  end
end


  def edit
end

  def update
end

  def destroy
end


  private

  def opportunity_params
    params.require(:opportunity).permit(:ministry, :who, :what, :when, :where, :user_id)
  end
end
