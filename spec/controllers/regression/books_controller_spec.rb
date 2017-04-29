require 'rails_helper'

RSpec.describe BooksController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/books/new').to('books#new', {}) }
  it { should route(:get, '/books').to('books#index', {}) }
  it { should route(:patch, '/books/1').to('books#update', {:id=>"1"}) } 
  it { should route(:post, '/books').to('books#create', {}) } 
  it { should route(:delete, '/books/1').to('books#destroy', {:id=>"1"}) } 
  it { should route(:get, '/books/1/edit').to('books#edit', {:id=>"1"}) }
  it { should route(:get, '/books/1').to('books#show', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_book) }
  it { should use_before_filter(:authenticate_user!) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end