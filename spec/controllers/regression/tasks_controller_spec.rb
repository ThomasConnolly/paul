require 'rails_helper'

RSpec.describe TasksController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/tasks/new').to('tasks#new', {}) }
  it { should route(:get, '/tasks').to('tasks#index', {}) }
  it { should route(:patch, '/tasks/1').to('tasks#update', {:id=>"1"}) } 
  it { should route(:post, '/tasks').to('tasks#create', {}) } 
  it { should route(:delete, '/tasks/1').to('tasks#destroy', {:id=>"1"}) } 
  it { should route(:get, '/tasks/1').to('tasks#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:all_tasks) }
  it { should use_before_filter(:set_tasks) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end