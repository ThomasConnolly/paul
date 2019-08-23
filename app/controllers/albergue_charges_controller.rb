# frozen_string_literal: true

class AlbergueChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @albergue_donation = AlbergueDonation.find(current_user.albergue_donation.id)

    customer = current_user.stripe_customer
    customer.sources.create(source: params[:stripeToken])

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 27_500,
      description: 'Albergue',
      currency: 'usd'
    )
    @albergue_donation.update(plan: 'full')
    current_user.update(
      source: params[:stripeToken], stripe_customer_id: customer.id
    )
    current_user.save
    redirect_to root_path, notice: 'Thank you very much for sponsoring a child at the albergue.'
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to ticket_charges_path
    end
    end
