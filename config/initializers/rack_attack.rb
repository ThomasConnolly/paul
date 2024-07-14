# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.blocklist('block non-US and non-Canada IPs for registration') do |req|
      if req.path == '/register' || req.path == '/sign_up'
        result = Geocoder.search(req.ip).first
        country_code = result&.country_code
        country_code.present? && country_code != 'US' && country_code != 'CA'
      else
        false
      end
    end
  end
end
