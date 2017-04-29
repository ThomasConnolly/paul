require 'rails_helper'

RSpec.describe JubileePlans::CommentsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/jubilee_plans/1/comments').to('jubilee_plans/comments#create', {:jubilee_plan_id=>"1"}) } 
  it { should route(:delete, '/jubilee_plans/1/comments/1').to('jubilee_plans/comments#destroy', {:jubilee_plan_id=>"1", :id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_commentable) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:send_mail) }
  # === Callbacks (Around) ===
  
end