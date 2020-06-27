if Rails.env.development?
  Rails.configuration.stripe = {
    public_key: Rails.application.credentials.stripe[:publishable_key],
    private_key: Rails.application.credentials.stripe[:secret_key],
  }
  Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
  StripeEvent.signing_secret = "whsec_30F5JJT231woSHo8hmtHxt6swYyCIpaZ"
elsif Rails.env.production?
  Rails.configuration.stripe = {
    public_key: ENV["STRIPE_PUBLISHABLE_KEY"],
    private_key: ENV["STRIPE_SECRET_KEY"],
  }
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"] 
  StripeEvent.signing_secret = ENV["STRIPE_EVENT_SIGNING_SECRET"]
end
