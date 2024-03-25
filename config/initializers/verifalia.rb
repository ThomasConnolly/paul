# frozen_string_literal: true

require 'verifalia'

Verifalia::Client.new(

  username: Rails.application.credentials.dig(:verifalia, :username),
  password: Rails.application.credentials.dig(:verifalia, :password)
)
