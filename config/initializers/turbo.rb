# typed: false
# frozen_string_literal: true

Rails.application.config.turbo.streams = false if defined?(Turbo) && Rails.application.config.respond_to?(:turbo)
