class SponsorshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sponsorship, only: [:show, :edit, :update, :destroy]
  before_action :change_sponsorship, only: :new

  # GET /sponsorships
  # GET /sponsorships.json
  def index
    @sponsorships = Sponsorship.all
  end

  # GET /sponsorships/1
  # GET /sponsorships/1.json
  def show
  end

  # GET /sponsorships/new
  def new
    @sponsorship = Sponsorship.new
  end

  def monthly_sponsorship
  end

  def quarterly_sponsorship
  end

  # GET /sponsorships/1/edit
  def edit
  end

  # POST /sponsorships
  # POST /sponsorships.json
  def create
    @sponsorship = Sponsorship.new(sponsorship_params)
    @sponsorship.user_id = current_user.id if current_user

    respond_to do |format|
      if @sponsorship.save
        format.html { redirect_to @sponsorship, notice: 'Sponsorship was successfully created.' }
        format.json { render :show, status: :created, location: @sponsorship }
      else
        format.html { render :new }
        format.json { render json: @sponsorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsorships/1
  # PATCH/PUT /sponsorships/1.json
  def update
    respond_to do |format|
      if @sponsorship.update(sponsorship_params)
        format.html { redirect_to @sponsorship, notice: 'Sponsorship was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsorship }
      else
        format.html { render :edit }
        format.json { render json: @sponsorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsorships/1
  # DELETE /sponsorships/1.json
  def destroy
    @sponsorship.destroy
    respond_to do |format|
      format.html { redirect_to sponsorships_url, notice: 'Sponsorship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsorship
      @sponsorship = Sponsorship.find(current_user.sponsorship.id)
    end

    def change_sponsorship
      if current_user.sponsorship.present?
        redirect_to edit_sponsorship_path(current_user.sponsorship.id)
      end
    end


    def redirect_to_signup
    if !user_signed_in?
      session["user_return_to"] = new_sponsorship_path
      redirect_to new_user_registration_path
    end
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsorship_params
      params.require(:sponsorship).permit(:user_id, :amount, :plan, :customer_id, :card, :last_4, :expiraton_date)
    end
end
