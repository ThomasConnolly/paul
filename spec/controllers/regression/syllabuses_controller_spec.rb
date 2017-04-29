require 'rails_helper'

RSpec.describe SyllabusesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/syllabuses/new').to('syllabuses#new', {}) }
  it { should route(:get, '/syllabuses').to('syllabuses#index', {}) }
  it { should route(:patch, '/syllabuses/1').to('syllabuses#update', {:id=>"1"}) } 
  it { should route(:post, '/syllabuses/import').to('syllabuses#import', {}) } 
  it { should route(:post, '/syllabuses').to('syllabuses#create', {}) } 
  it { should route(:delete, '/syllabuses/1').to('syllabuses#destroy', {:id=>"1"}) } 
  it { should route(:get, '/syllabuses/1/edit').to('syllabuses#edit', {:id=>"1"}) }
  it { should route(:get, '/syllabuses/1').to('syllabuses#show', {:id=>"1"}) }
  it { should route(:get, '/syllabuses/primary').to('syllabuses#primary', {}) }
  it { should route(:get, '/syllabuses/preschool').to('syllabuses#preschool', {}) }
  it { should route(:get, '/syllabuses/intermediate').to('syllabuses#intermediate', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_syllabus) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end