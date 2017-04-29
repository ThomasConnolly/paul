require 'rails_helper'

RSpec.describe FormationTalksController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/formation_talks/new').to('formation_talks#new', {}) }
  it { should route(:get, '/formation_talks').to('formation_talks#index', {}) }
  it { should route(:patch, '/formation_talks/1').to('formation_talks#update', {:id=>"1"}) } 
  it { should route(:post, '/formation_talks').to('formation_talks#create', {}) } 
  it { should route(:delete, '/formation_talks/1').to('formation_talks#destroy', {:id=>"1"}) } 
  it { should route(:get, '/formation_talks/1/edit').to('formation_talks#edit', {:id=>"1"}) }
  it { should route(:get, '/formation_talks/1').to('formation_talks#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_formation_talk) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end