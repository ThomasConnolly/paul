# typed: true
# frozen_string_literal: true

require 'verifalia'

module VerifaliaConfig
  def self.client
    Verifalia::Client.new(
      username: Rails.application.credentials.dig(:verifalia, :username),
      password: Rails.application.credentials.dig(:verifalia, :password)
    )
  end
end
