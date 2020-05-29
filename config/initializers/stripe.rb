 if Rails.env.development?
  Rails.configuration.stripe = {
    public_key: Rails.application.credentials.stripe[:public_key],
    private_key: Rails.application.credentials.stripe[:private_key],
    signing_secret: Rails.application.credentials.stripe[:signing_secret]
 }
  Stripe.api_key = Rails.application.credentials.stripe[:private_key]
 end

if Rails.env.production?
  Rails.configuration.stripe = {
    public_key: ENV["STRIPE_PUBLISHABLE_KEY"],
    private_key: ENV["STRIPE_SECRET_KEY"],
    signing_secret: ENV["SIGNING_SECRET"]
  }
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
end

StripeEvent.signing_secret = Rails.application.credentials.stripe  [:signing_secret]
