# frozen_string_literal: true

module Rack
  class Attack
    Rack::Attack.blocklist('block non-US and non-Canada IPs for registration') do |req|
      Rails.logger.info "Rack::Attack inspecting request from IP: #{req.ip}"
      if req.path == 'users/sign_up' || req.path == '/users'
        result = Geocoder.search(req.ip).first
        country_code = result&.country_code
        Rails.logger.info "Country code detected: #{country_code}"
        country_code.present? && country_code != 'US' && country_code != 'CA'
      else
        false
      end
    end
  end
end
