Rails.configuration.stripe = {
  public_key: Rails.application.credentials.stripe[:public_key],
  private_key: Rails.application.credentials.stripe[:private_key],
}

Stripe.api_key = Rails.application.credentials.stripe[:private_key]
