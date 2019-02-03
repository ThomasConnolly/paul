class AlbergueDonationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_albergue_donation, only: [:show, :edit, :update, :destroy]

  def new
    @albergue_donation = AlbergueDonation.new
    @albergue_donation.user_id = current_user.id if current_user
  end

  def index
    @albergue_donations = AlbergueDonation.all
  end

  def show
  end

  def edit
    @albergue_donation = AlbergueDonation.find(params[:id])
  end

  def create
    @albergue_donation = AlbergueDonation.new(albergue_donation_params)
    @albergue_donation.user_id = current_user.id if current_user
      if @albergue_donation.save
        redirect_to new_albergue_charge_path
      else
        render :new
    end
  end

  def update
      @albergue_donation.update(albergue_donation_params)
  end

  def destroy
    @albergue_donation.destroy
      redirect_to albergue_donations_url, notice: 'Donation was successfully destroyed.'
  end


  private

    def set_albergue_donation
      @albergue_donation = AlbergueDonation.find(params[:id])
    end

    def albergue_donation_params
      params.require(:albergue_donation).permit(:plan, :stripe_plan, :user_id, :anonymous)
  end
end
