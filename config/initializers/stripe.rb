 if Rails.env.development?
  Rails.configuration.stripe = {
    public_key: Rails.application.credentials.stripe[:publishable_key],
    private_key: Rails.application.credentials.stripe[:secret_key],
    signing_secret: Rails.application.credentials.stripe[:signing_secret]
 }
  Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
 end

if Rails.env.production?
  Rails.configuration.stripe = {
    public_key: ENV["STRIPE_PUBLISHABLE_KEY"],
    private_key: ENV["STRIPE_SECRET_KEY"],
    signing_secret: ENV["STRIPE_SIGNING_SECRET"]
  }
  Stripe.api_key = ENV["STRIPE_SECRET_KEY"] 
 end
