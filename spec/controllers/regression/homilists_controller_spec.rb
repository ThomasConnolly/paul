require 'rails_helper'

RSpec.describe HomilistsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/homilists/new').to('homilists#new', {}) }
  it { should route(:get, '/homilists').to('homilists#index', {}) }
  it { should route(:patch, '/homilists/1').to('homilists#update', {:id=>"1"}) } 
  it { should route(:post, '/homilists').to('homilists#create', {}) } 
  it { should route(:delete, '/homilists/1').to('homilists#destroy', {:id=>"1"}) } 
  it { should route(:get, '/homilists/1/edit').to('homilists#edit', {:id=>"1"}) }
  it { should route(:get, '/homilists/1').to('homilists#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_Homilist) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_admin_only) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end