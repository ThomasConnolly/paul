# frozen_string_literal: true

Stripe.api_key = Rails.application.credentials[:stripe][Rails.env.to_sym][:secret_key]
