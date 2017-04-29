require 'rails_helper'

RSpec.describe VreportsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/vreports/new').to('vreports#new', {}) }
  it { should route(:get, '/vreports').to('vreports#index', {}) }
  it { should route(:patch, '/vreports/1').to('vreports#update', {:id=>"1"}) } 
  it { should route(:post, '/vreports').to('vreports#create', {}) } 
  it { should route(:delete, '/vreports/1').to('vreports#destroy', {:id=>"1"}) } 
  it { should route(:get, '/vreports/1/edit').to('vreports#edit', {:id=>"1"}) }
  it { should route(:get, '/vreports/1').to('vreports#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:vestry_only) }
  it { should use_before_filter(:set_vreport) }
  it { should use_before_filter(:all_vreports) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end