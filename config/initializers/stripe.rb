
Stripe.api_key = Rails.application.credentials.dig(:stripe, :production, :secret_key)
