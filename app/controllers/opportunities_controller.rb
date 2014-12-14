class OpportunitiesController < InheritedResources::Base
  
def index
  @opportunities = Opportunity.all.order(:ministry)
end

def show
end



