require 'rails_helper'

RSpec.describe TicketsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/events/1/tickets/new').to('tickets#new', {:event_id=>"1"}) }
  it { should route(:get, '/events/1/tickets').to('tickets#index', {:event_id=>"1"}) }
  it { should route(:patch, '/events/1/tickets/1').to('tickets#update', {:event_id=>"1", :id=>"1"}) } 
  it { should route(:post, '/events/1/tickets').to('tickets#create', {:event_id=>"1"}) } 
  it { should route(:get, '/events/1/tickets/1').to('tickets#show', {:event_id=>"1", :id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:set_event) }
  it { should use_before_filter(:set_ticket) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end