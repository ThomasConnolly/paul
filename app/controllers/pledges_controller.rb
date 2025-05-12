# typed: false
# frozen_string_literal: true

class PledgesController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :change_path, only: [:new]
  before_action :set_pledge, only: %i[show edit update destroy]
  before_action :admin_only, only: [:index]

  def index
    @pledges = Pledge.all
  end

  def new
    @pledge = Pledge.new
  end

  def edit; end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id

    if @pledge.save
      redirect_to(checkout_pledge_path(@pledge))
    else
      render(:new)
    end
  end

  def update
    old_interval = @pledge.interval
    old_dollars = @pledge.dollars

    if @pledge.update(pledge_params)
      # Check if we need to update Stripe
      if @pledge.subscription_id.present? &&
         (@pledge.interval != old_interval || @pledge.dollars != old_dollars)
        begin
          # Fetch the subscription to get the item ID
          subscription = Stripe::Subscription.retrieve(@pledge.subscription_id)
          item_id = subscription.items.data.first.id

          # Update the subscription item with new price and quantity
          Stripe::Subscription.update(
            @pledge.subscription_id,
            {
              items: [{
                id: item_id,
                price: @pledge.price_id, # This gets set via before_save in your model
                quantity: @pledge.dollars
              }]
            }
          )
          flash[:notice] = 'Your pledge has been updated.'
        rescue StandardError => e
          # Log the error but don't fail
          Rails.logger.error "Stripe update failed: #{e.message}"
          flash[:alert] =
            "Your pledge was saved but the payment processor couldn't be updated."
        end
      else
        flash[:notice] = 'Your pledge has been updated.'
      end

      redirect_to(pledge_path(@pledge))
    else
      render(:edit)
    end
  end

  def destroy
    if @pledge.subscription_id.present?
      begin
        # Cancel the subscription in Stripe
        Stripe::Subscription.cancel(@pledge.subscription_id)
      rescue StandardError => e
        # Log the error but continue with deletion
        Rails.logger.error "Stripe cancellation failed: #{e.message}"
      end
    end

    @pledge.destroy
    redirect_to(root_path, notice: 'Your pledge has been canceled.')
  end

  private

  def set_pledge
    @pledge = Pledge.find(params[:id])
  end

  def change_path
    return unless user_signed_in? && current_user.pledge.present?

    redirect_to(pledge_path(current_user.pledge))
  end

  def redirect_to_login
    return if user_signed_in?

    session['user_return_to'] = new_pledge_path
    redirect_to(new_user_registration_path)
  end

  def admin_only
    return if user_signed_in? && current_user.roles.include?('admin')

    redirect_to(root_path, alert: 'You are not authorized to view all pledges.')
  end

  def pledge_params
    params.expect(pledge: %i[amount dollars interval])
  end
end
