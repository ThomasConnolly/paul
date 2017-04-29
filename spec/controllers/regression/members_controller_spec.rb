require 'rails_helper'

RSpec.describe MembersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/members/index').to('members#index', {}) }
  it { should route(:patch, '/members/1').to('members#update', {:id=>"1"}) } 
  it { should route(:get, '/members/import').to('members#import', {}) }
  it { should route(:delete, '/members/1').to('members#destroy', {:id=>"1"}) } 
  it { should route(:get, '/members/1/edit').to('members#edit', {:id=>"1"}) }
  it { should route(:get, '/members/1').to('members#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_member) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end