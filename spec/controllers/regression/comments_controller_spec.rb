require 'rails_helper'

RSpec.describe CommentsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:delete, '/comments/1').to('comments#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end