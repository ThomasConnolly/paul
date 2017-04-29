require 'rails_helper'

RSpec.describe OpportunitiesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/opportunities/new').to('opportunities#new', {}) }
  it { should route(:get, '/opportunities').to('opportunities#index', {}) }
  it { should route(:patch, '/opportunities/1').to('opportunities#update', {:id=>"1"}) } 
  it { should route(:post, '/opportunities').to('opportunities#create', {}) } 
  it { should route(:delete, '/opportunities/1').to('opportunities#destroy', {:id=>"1"}) } 
  it { should route(:get, '/opportunities/1/edit').to('opportunities#edit', {:id=>"1"}) }
  it { should route(:get, '/opportunities/1').to('opportunities#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_opportunity) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end