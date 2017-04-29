require 'rails_helper'

RSpec.describe PledgesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/pledge/new').to('pledges#new', {}) }
  it { should route(:patch, '/pledge').to('pledges#update', {}) } 
  it { should route(:post, '/pledge').to('pledges#create', {}) } 
  it { should route(:delete, '/pledge').to('pledges#destroy', {}) } 
  it { should route(:get, '/pledge/edit').to('pledges#edit', {}) }
  it { should route(:get, '/pledges/confirmation').to('pledges#confirmation', {}) }
  it { should route(:get, '/pledge').to('pledges#show', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_pledge) }
  it { should use_before_filter(:change_pledge) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end