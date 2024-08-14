# typed: strict
# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.blocklist('block non-US & Canada IPs') do |req|
      if req.path == '/users' && req.post?
        result = Geocoder.search(req.ip).first
        country = result&.country
        country != 'US' && country != 'CA'
      else
        false
      end
    end
  end
end
