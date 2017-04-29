require 'rails_helper'

RSpec.describe JubileePlansController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/jubilee_plans/new').to('jubilee_plans#new', {}) }
  it { should route(:get, '/jubilee_plans').to('jubilee_plans#index', {}) }
  it { should route(:patch, '/jubilee_plans/1').to('jubilee_plans#update', {:id=>"1"}) } 
  it { should route(:post, '/jubilee_plans').to('jubilee_plans#create', {}) } 
  it { should route(:delete, '/jubilee_plans/1').to('jubilee_plans#destroy', {:id=>"1"}) } 
  it { should route(:get, '/jubilee_plans/1/edit').to('jubilee_plans#edit', {:id=>"1"}) }
  it { should route(:get, '/jubilee_plans/1').to('jubilee_plans#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end