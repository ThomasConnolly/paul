# frozen_string_literal: true
Cloudinary.config do |config|
  config.api_key = ENV['CL_API_KEY']
  config.api_secret = ENV['CL_API_SECRET'] 
  config.secure = true
  config.cdn_subdomain = true
end
