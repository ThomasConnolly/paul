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
  @opportunity = Opportunity.new
end

def create
  @opportunity = Opportunity.new(opportunity_params)

  respond_to do |format|
    if @opportunity.save
      format.html { redirect_to @opportunity, notice: 'Your entry was successfully created.' }
    else
      format.html { render :new }
    end
  end
end

  
def update
  respond_to do |format|
    if @opportunity.update(opportunity_params)
      format.html { redirect_to @opportunity, notice: 'Entry was successfully updated.' }
    else
      render :new
        
    end
  end
end

def destroy
  @opportunity.destroy
  respond_to do |format|
    format.html { redirect_to opportunity_url, notice: 'Entry was successfully destroyed.' }
  end
end




private 

def set_opportunity
  @opportunity = Opportunity.find(params[:id])
end 

def opportunity_params
  params.require(:opportunity).permit(:user_id, :ministry, :who, :what, :when, :where)
end
end