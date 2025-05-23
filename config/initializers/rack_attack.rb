# typed: strict
# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.blocklist('block non-US & Canada IPs') do |req|
      # Allow requests in development or from localhost to bypass the geoblock
      next false if Rails.env.development? || req.ip == '127.0.0.1'

      if req.path == '/users' && req.post?
        result = Geocoder.search(req.ip).first
        country = result&.country
        # Block if country is not US or CA
        country != 'US' && country != 'CA'
      else
        # Don't block other requests with this rule
        false
      end
    end
  end
end
