# frozen_string_literal: true

class CheckoutPledgesController < ApplicationController
  protect_from_forgery except: :webhook
  before_action :authenticate_user!

  def create
    @pledge = Pledge.find(params[:id])
    if @pledge.nil?
      redirect_to root_path
      return
    end

    checkout_session = Stripe::Checkout::Session.create({
                                                          success_url: "#{checkout_pledges_success_url}?session_id={CHECKOUT_SESSION_ID}",
                                                          cancel_url: pledges_url,

                                                          payment_method_types: ['card'],
                                                          customer: @pledge.user.stripe_id,
                                                          line_items: [{
                                                            price: @pledge.stripe_id,
                                                            currency: 'usd',
                                                            amount: (@pledge.dollars.to_i * 100)

                                                          }],
                                                          metadata: {
                                                            pledge_id: @pledge.id
                                                          },
                                                          payment_intent_data: {
                                                            metadata: {
                                                              pledge_id: @pledge.id
                                                            }
                                                          },
                                                          mode: 'payment'
                                                        })
    redirect_to checkout_session.url, allow_other_host: true
  end
end
