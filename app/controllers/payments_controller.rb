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
    @payment_intent = 
      Stripe::PaymentIntent.retrieve(params[:payment_intent_id])
      if @payment_intent.status == "succeeded"
        charge = @payment_intent.charges.data.first
        card = charge.payment_method_details.card

      @payment = Payment.create({
        stripe_id: charge.id,
        user_id: current_user.id,
        card_brand: card.brand.titleize,
        card_last4: card.last4,
        card_exp_month: card.exp_month,
        card_exp_year: card.exp_year,
      })
      @payment.update({
        user_id: current_user.id,
        stripe_id: charge.id,
        card_brand: params[card.brand],
        card_last4: params[card.last4],
        card_exp_month: params[card.exp_month],
        card_exp_year: params[card.exp_year],
      })
      @payment.save
        redirect_to root_path, notice: "Thank you for your gifts to St. Paul's!"
      else
        flash[:alert] = "Payment did not succeed. Please try again"
        render action: :show
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

    def payment_params
      params.require(:payment).permit(:user_id, stripe_id, card_brand, card_last4, card_exp_month, card_exp_year )
    end
end


