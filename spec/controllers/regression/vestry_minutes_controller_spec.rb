require 'rails_helper'

RSpec.describe VestryMinutesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/vestry_minutes/new').to('vestry_minutes#new', {}) }
  it { should route(:get, '/vestry_minutes').to('vestry_minutes#index', {}) }
  it { should route(:patch, '/vestry_minutes/1').to('vestry_minutes#update', {:id=>"1"}) } 
  it { should route(:post, '/vestry_minutes').to('vestry_minutes#create', {}) } 
  it { should route(:delete, '/vestry_minutes/1').to('vestry_minutes#destroy', {:id=>"1"}) } 
  it { should route(:get, '/vestry_minutes/1/edit').to('vestry_minutes#edit', {:id=>"1"}) }
  it { should route(:get, '/vestry_minutes/1').to('vestry_minutes#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_vestry_minute) }
  it { should use_before_filter(:admin_only) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end