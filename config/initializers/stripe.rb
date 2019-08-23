# frozen_string_literal: true

Rails.configuration.stripe = {
  # First two are live keys, second two are test keys
  # These are the only keys that need to change to switch between prod & test
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIPE_SECRET_KEY']

  #:publishable_key => Rails.application.credentials.stripe[:publishable_key],
  #:secret_key => Rails.application.credentials.stripe[:secret_key]
}
Stripe.api_key = ENV['STRIPE_SECRET_KEY']
# Stripe.api_key = Rails.configuration.stripe[:secret_key]
# StripeEvent.signing_secret = Rails.application.credentials.stripe_webhook_secret
#
# StripeEvent.configure do |config|
#   config.subscribe "charge." do |event|
#     Webhooks::Charge.new(event).call
#   end
# end
