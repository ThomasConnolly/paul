require 'rails_helper'

RSpec.describe PrayersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/prayers/new').to('prayers#new', {}) }
  it { should route(:get, '/prayers').to('prayers#index', {}) }
  it { should route(:patch, '/prayers/1').to('prayers#update', {:id=>"1"}) } 
  it { should route(:post, '/prayers').to('prayers#create', {}) } 
  it { should route(:get, '/prayers/1/edit').to('prayers#edit', {:id=>"1"}) }
  it { should route(:get, '/prayers/1').to('prayers#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_prayer) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end