class CheckoutController < ApplicationController

  def create
    @donation = Donation.find(params[:id])

    if @donation.nil?
      redirect_to root_path
      return
    end

    @customer = if current_user.stripe_id?
      Stripe::Customer.retrieve(current_user.stripe_id)
    else
      Stripe::Customer.create(email: current_user.email)
    end

    current_user.update!(stripe_id: @customer.id)

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        currency: 'usd',
        amount: @donation.amount,
        quantity: 1,
        name: "St. Paul's Episcopal Church",
        description: "Donation to St. Paul's",
      }],
      customer: @customer,
      success_url: checkout_success_url + '?session_id{CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url,
    )

      respond_to do |format|
        format.js # render create.js.erb
      end
  end
end