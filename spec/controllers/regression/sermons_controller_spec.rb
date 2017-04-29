require 'rails_helper'

RSpec.describe SermonsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/sermons/new').to('sermons#new', {}) }
  it { should route(:get, '/sermons').to('sermons#index', {}) }
  it { should route(:patch, '/sermons/1').to('sermons#update', {:id=>"1"}) } 
  it { should route(:post, '/sermons').to('sermons#create', {}) } 
  it { should route(:delete, '/sermons/1').to('sermons#destroy', {:id=>"1"}) } 
  it { should route(:get, '/sermons/1/edit').to('sermons#edit', {:id=>"1"}) }
  it { should route(:get, '/sermons/1').to('sermons#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_sermon) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end