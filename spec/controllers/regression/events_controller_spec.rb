require 'rails_helper'

RSpec.describe EventsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/events/new').to('events#new', {}) }
  it { should route(:get, '/events').to('events#index', {}) }
  it { should route(:patch, '/events/1').to('events#update', {:id=>"1"}) } 
  it { should route(:post, '/events').to('events#create', {}) } 
  it { should route(:delete, '/events/1').to('events#destroy', {:id=>"1"}) } 
  it { should route(:get, '/events/1/edit').to('events#edit', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:admin_only) }
  it { should use_before_filter(:set_event) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end