class DonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:index]

  if current_user.stripe_id?
    @customer = Stripe::Customer.retrieve(current_user.stripe_id)
  else
    @customer = Stripe::Customer.create(email: current_user.email, name: current_user.username)
    current_user.update!(stripe_id: @customer.id)
  end

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def edit
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.user_id = current_user.id

    if @donation.save
      checkout_session = Stripe::Checkout::Session.create(
        success_url: donation_url(@donation) + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: donation_url,
        payment_method_types: ["card"],
        submit_type: 'donate',
        customer: @customer.stripe_id,
        mode: 'payment',
        line_items: [{
          price_data: {
            unit_amount: @donation.amount,
            currency: 'usd',
            product: prod_ETteQ8s9Ho9sNW,
          },
          quantity: 1,
      }])
      redirect_to checkout_session.url
    else
      flash[:errors] = @donation.errors.full_messages
      rendernew
    end
  end
  
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end

    def authenticate_admin
      return unless !current_user.has_role?(:admin)
      redirect_to root_path
    end

    def donation_params
      params.require(:donation).permit(:amount, :memo)
    end
end
