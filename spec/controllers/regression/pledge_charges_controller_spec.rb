require 'rails_helper'

RSpec.describe PledgeChargesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/pledge_charges/new').to('pledge_charges#new', {}) }
  it { should route(:post, '/pledge_charges').to('pledge_charges#create', {}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end