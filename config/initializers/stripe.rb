
Stripe.api_key = Rails.application.credentials.stripe[:secret_key]

# Stripe.api_key = Rails.configuration.stripe[:secret_key]
# StripeEvent.signing_secret = Rails.application.credentials.stripe_webhook_secret
#
# StripeEvent.configure do |config|
#   config.subscribe "charge." do |event|
#     Webhooks::Charge.new(event).call
#   end
# end
