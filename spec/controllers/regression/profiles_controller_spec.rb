require 'rails_helper'

RSpec.describe ProfilesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/profiles/new').to('profiles#new', {}) }
  it { should route(:get, '/profiles').to('profiles#index', {}) }
  it { should route(:patch, '/profiles/1').to('profiles#update', {:id=>"1"}) } 
  it { should route(:post, '/profiles').to('profiles#create', {}) } 
  it { should route(:get, '/profiles/1/edit').to('profiles#edit', {:id=>"1"}) }
  it { should route(:get, '/profiles/1').to('profiles#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_profile) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end