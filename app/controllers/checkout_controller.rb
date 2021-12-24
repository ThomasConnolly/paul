class CheckoutController < ApplicationController
protect_from_forgery except: :webhook
before_action :authenticate_user!


  def create
    @donation = Donation.find(params[:id])
      if @donation.nil?
        redirect_to root_path
        return
      end
      
      if current_user.stripe_id?
        @customer = Stripe::Customer.retrieve(current_user.stripe_id)
      else
        @customer = Stripe::Customer.create(email: current_user.email)
        current_user.update!(stripe_id: @customer.id)
      end

    @session = Stripe::Checkout::Session.create({
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      payment_method_types: ["card"],
      submit_type: 'donate',
      line_items: [
        {'amount': @donation.amount,
        'currency': 'usd',
        'quantity': 1,
        'name': 'Donation to St. Paul\'s',
        'images': ['https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1426355636/logos/New_StPaul_LogoWeb.jpg'],
        }]
        }
    )
    respond_to do |format|
      format.js
    end
  end
end
