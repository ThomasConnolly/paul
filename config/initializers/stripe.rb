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

class RecordCheckout
  def call(event)
    event.class         #=> Stripe::Event
    event.type         #=> "checkout.session.completed"
    event.data.object   #=> <Stripe::Charge:03fxxxx>

    ev = event.data.object
    user = User.find_by(stripe_id: ev.customer)
    if ev.mode == subscription
      pledge = Pledge.find(user.pledge.id)
      pledge.update!(stripe_id: ev.subscription)
    else
      donation = Donation.find_by(user: user.id)
      donation.update!(stripe_id: ev.payment_intent)
    end
  end
end

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', RecordCheckout.new
end
