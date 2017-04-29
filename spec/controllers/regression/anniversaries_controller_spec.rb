require 'rails_helper'

RSpec.describe AnniversariesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/anniversaries').to('anniversaries#index', {}) }
  it { should route(:post, '/anniversaries/import').to('anniversaries#import', {}) } 
  it { should route(:post, '/anniversaries').to('anniversaries#create', {}) } 
  it { should route(:delete, '/anniversaries/1').to('anniversaries#destroy', {:id=>"1"}) } 
  it { should route(:get, '/anniversaries/1').to('anniversaries#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_anniversary) }
  it { should use_before_filter(:set_admin_only) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end