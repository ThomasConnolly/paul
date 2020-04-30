class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation
  before_action :set_stripe

  def show
    @payment_intent = Stripe::PaymentIntent.create(
      amount: @donation.amount,
      currency: 'usd',
    )
  end

  def create
   
    @payment_intent = Stripe::PaymentIntent.retrieve
      if @payment_intent.status == "succeeded"
        charge = @payment_intent.charges.data.first
        card = charge.payment_method_details.card

        @payment = Payment.create(
          stripe_id: charge.id,
          user: current_user,
          donation: @donation,
          card_brand: card.brand.titleize,
          card_last4: card.last4,
          card_exp_month: card.exp_month,
          card_exp_year: card.exp_year,
        )
        redirect_to root_path, notice: "Thank you for your gifts to St. Paul's!"
      else
        flash[:alert] = "Your payment was unsuccessful. Please try again."
        render :show
      end
    end
  



  private
  
    def set_stripe
      Stripe.api_key = 
      Rails.application.credentials.stripe[:private_key] 
    end

    def set_donation
      @donation = Donation.find(params[:donation_id])
    end
end
