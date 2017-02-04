class PledgeChargesController < ApplicationController
  def new
  end

  def create
    @amount = Pledge.new(params[:pay_this])


    Stripe::Charge.create(
       :amount      => @amount,
       :description => "Pledge Payment",
       :currency    => 'usd',
       :plan        => @pledge.plan
       :source      => params[]
     )

    # purchase = Purchase.create(email: params[:stripeEmail],
      # card: params[:stripeToken], amount: params[:amount],
      # description: charge.description, currency: charge.currency,
      # product_id: 1, customer_id: customer.id, uuid: SecureRandom.uuid)

    # redirect_to purchase

    #redirect_to pledges/confirmation

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
