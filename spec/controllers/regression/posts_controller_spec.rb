require 'rails_helper'

RSpec.describe PostsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/posts/new').to('posts#new', {}) }
  it { should route(:get, '/posts').to('posts#index', {}) }
  it { should route(:patch, '/posts/1').to('posts#update', {:id=>"1"}) } 
  it { should route(:post, '/posts').to('posts#create', {}) } 
  it { should route(:delete, '/posts/1').to('posts#destroy', {:id=>"1"}) } 
  it { should route(:get, '/posts/1/edit').to('posts#edit', {:id=>"1"}) }
  it { should route(:get, '/posts/1').to('posts#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:members_only) }
  it { should use_before_filter(:set_post) }
  it { should use_before_filter(:all_posts) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end