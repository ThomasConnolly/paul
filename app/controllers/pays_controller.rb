class PaysController < ApplicationController
def new
  @donation = Donation.find(params[:id])
end

# Set your secret key. Remember to switch to your live secret key in production!
# See your keys here: https://dashboard.stripe.com/account/apikeys
Stripe.api_key = 'sk_test_0AqInf4x5zH6lqth616XDU7b'

session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    name: 'Donation',
    description: "Saint Paul's Episcopal Church",
    images: 
    amount:
    plan: @donation.stripe_plan,
    quantity: @donation.dollars.to_i,
    currency: 'usd',
  }],
  success_url: 'https://saintpaulsnaples.org/success?session_id={CHECKOUT_SESSION_ID}',
  cancel_url: new_donation_path,
)