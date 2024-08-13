# typed: strict
# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.blocklist('block non-US and non-Canada IPs for registration')
    do |req|
      Rails.logger.info "Rack::Attack inspecting request from IP: #{req.ip}"
      if req.path == '/users' && req.post?
        result = Geocoder.search(req.ip).first
        country = result&.country        
        country != 'US' && country != 'CA'
      end
    end
  end
end

