require 'rails_helper'

RSpec.describe PagesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/pages/directions').to('pages#directions', {}) }
  it { should route(:get, '/pages/albergue').to('pages#albergue', {}) }
  it { should route(:get, '/pages/concert').to('pages#concert', {}) }
  it { should route(:get, '/pages/calendar').to('pages#calendar', {}) }
  it { should route(:get, '/pages/haitian').to('pages#haitian', {}) }
  it { should route(:get, '/pages/tumaini').to('pages#tumaini', {}) }
  it { should route(:get, '/pages/how_to_pray').to('pages#how_to_pray', {}) }
  it { should route(:get, '/pages/python_tutor').to('pages#python_tutor', {}) }
  it { should route(:get, '/pages/how_to_use').to('pages#how_to_use', {}) }
  it { should route(:get, '/.well-known/acme-challenge/1').to('pages#letsencrypt', {:id=>"1"}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_turbolinks_location_header_from_session) }
  it { should use_before_filter(:store_current_location) }
  it { should use_before_filter(:configure_permitted_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  # === Callbacks (Around) ===
  
end