require 'rails_helper'

RSpec.describe StoryIdeasController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/story_ideas/new').to('story_ideas#new', {}) }
  it { should route(:get, '/story_ideas').to('story_ideas#index', {}) }
  it { should route(:patch, '/story_ideas/1').to('story_ideas#update', {:id=>"1"}) } 
  it { should route(:post, '/story_ideas').to('story_ideas#create', {}) } 
  it { should route(:delete, '/story_ideas/1').to('story_ideas#destroy', {:id=>"1"}) } 
  it { should route(:get, '/story_ideas/1/edit').to('story_ideas#edit', {:id=>"1"}) }
  it { should route(:get, '/story_ideas/1').to('story_ideas#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_story_idea) }
  it { should use_before_filter(:all_story_ideas) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end