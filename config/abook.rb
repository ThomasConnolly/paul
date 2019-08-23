# frozen_string_literal: true

FACEBOOK_CONFIG =
  YAML.load_file("#{::Rails.root}/config/facebook.yml")[::Rails.env]
