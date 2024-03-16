# frozen_string_literal: true

class Rack::Attack
  Rack::Attack.blocklist('block non-US and non-Canada IPs for registration') do |req|
    if req.path == '/register' || req.path == '/sign_up'
      country_code = Geocoder.search(req.ip).first.country_code
      country_code != 'US' && country_code != 'CA'
    else
      false
    end
  end
end
