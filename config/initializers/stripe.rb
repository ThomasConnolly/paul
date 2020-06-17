if Rails.env.development?
Rails.configuration.stripe = {
  public_key: Rails.application.credentials.stripe[:publishable_key],
  private_key: Rails.application.credentials.stripe[:secret_key],
}
Stripe.api_key = Rails.application.credentials.stripe[:secret_key]
end

if Rails.env.production?
Rails.configuration.stripe = {
  public_key: ENV["STRIPE_PUBLISHABLE_KEY"],
  private_key: ENV["STRIPE_SECRET_KEY"],
}
Stripe.api_key = ENV["STRIPE_SECRET_KEY"] 
end

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed' do |event|

  event.class         #=> Stripe::Event
  event.type          #=> "charge.failed"
  event.data.object   #=> <Stripe::Charge:03fxxxx>
  end
end