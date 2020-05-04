if Rails.env.development?
  Rails.configuration.stripe = {
    public_key: Rails.application.credentials.stripe[:public_key],
    private_key: Rails.application.credentials.stripe[:private_key],
 }

  Stripe.api_key = Rails.application.credentials.stripe[:private_key]
end

if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV[STRIPE_PUBLISHABLE_KEY],
    private_key: ENV[STRIPE_SECRET_KEY],
  }
  
  Stripe.api_key = ENV[STRIPE_SECRET_KEY]
end