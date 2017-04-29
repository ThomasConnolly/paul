require 'rails_helper'

RSpec.describe UsersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/new').to('users#new', {}) }
  it { should route(:get, '/users').to('users#index', {}) }
  it { should route(:patch, '/users/1').to('users#update', {:id=>"1"}) } 
  it { should route(:post, '/users/import').to('users#import', {}) } 
  it { should route(:get, '/users/1/edit').to('users#edit', {:id=>"1"}) }
  it { should route(:get, '/users/1').to('users#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:admin_only) }
  it { should use_before_filter(:member_only) }
  it { should use_before_filter(:set_user) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end