class DonationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create show edit destroy]
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.user_id = current_user.id

    if @donation.save
      redirect_to donation_pay_path(@donation), method: "post"
    else
      render :new
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

  # DELETE /donations/1
  # DELETE /donations/1.json
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

    # Only allow a list of trusted parameters through.
    def donation_params
      params.require(:donation).permit(:user, :dollars, :amount, :type, :stripe_email, :stripe_plan)
    end
end
