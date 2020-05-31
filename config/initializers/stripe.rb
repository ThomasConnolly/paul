Rails.configuration.stripe = {
  public_key: Rails.application.credentials.stripe[:public_key],
  private_key: Rails.application.credentials.stripe[:private_key],
  signing_secret: Rails.application.credentials.stripe[:signing_secret]
 }
  Stripe.api_key = Rails.application.credentials.stripe[:private_key]

