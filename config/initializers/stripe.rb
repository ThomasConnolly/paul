Rails.env.development?
  Rails.configuration.stripe = {
    public_key: Rails.application.credentials.stripe[:public_key],
    private_key: Rails.application.credentials.stripe[:private_key],
 }

  Stripe.api_key = Rails.application.credentials.stripe[:private_key]
else
  Rails.configuration.stripe = {
    publication_key: ENV[STRIPE_PUBLIATION_KEY],
    private_key: ENV[STRIPE_SECRET_KEY],
  }
  
  Stripe.api_key = ENV[STRIPE_SECRET_KEY]
end