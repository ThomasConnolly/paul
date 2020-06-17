
class PledgesController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :change_path, only: :new
  before_action :set_pledge, only: %i[show edit update destroy]

  def show; end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user_id = current_user.id if current_user
    if @pledge.save
      redirect_to pledge_path(@pledge)
    else
      render :new
    end
  end

  def edit; end

  def update
    @pledge.update_attributes(pledge_params)
    if @pledge.save
      redirect_to pledge_path(@pledge)
    else
      render :edit
    end
  end
  
  def cancel_now!
    Stripe::Subscription.delete(@pledge.stripe_id) if @pledge.stripe_id
    @pledge.destroy
  end
  
  def destroy

    # def destroy
    #   subscription_to_remove = params[:id]
    #   customer = Stripe::Customer.retrieve(current_user.stripe_id)
    #   customer.subscriptions.retrieve(subscription_to_remove).delete
    #   current_user.subscribed = false
  
    redirect_to root_path, notice: "Your subscription has been canceled."
  end



  private

  def set_pledge
    @pledge = Pledge.find(current_user.pledge.id)
  end

  def change_path
    if user_signed_in? && current_user.pledge.present?
      redirect_to pledge_path(current_user.pledge)
    end
  end

   def redirect_to_login
     if !user_signed_in?
       session["user_return_to"] = new_pledge_path
       redirect_to new_user_registration_path
     end
   end

  def pledge_params
    params.require(:pledge).permit %i[user_id amount stripe_id plan_id plan]
  end
end
