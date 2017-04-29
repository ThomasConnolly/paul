require 'rails_helper'

RSpec.describe MeditationsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/meditations/new').to('meditations#new', {}) }
  it { should route(:get, '/meditations').to('meditations#index', {}) }
  it { should route(:patch, '/meditations/1').to('meditations#update', {:id=>"1"}) } 
  it { should route(:post, '/meditations').to('meditations#create', {}) } 
  it { should route(:delete, '/meditations/1').to('meditations#destroy', {:id=>"1"}) } 
  it { should route(:get, '/meditations/1/edit').to('meditations#edit', {:id=>"1"}) }
  it { should route(:get, '/meditations/1').to('meditations#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_meditation) }
  it { should use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end