# typed: false
# frozen_string_literal: true

if defined?(Turbo) && Rails.application.config.respond_to?(:turbo)
    Rails.application.config.turbo.streams = false
  end