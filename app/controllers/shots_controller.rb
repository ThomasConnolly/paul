# frozen_string_literal: true

class ShotsController < ApplicationController
  before_action :set_shot, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: :index
  before_action :admin_only, only: :index

  # GET /shots or /shots.json
  def index
    @shots = Shot.all

    respond_to do |format|
      format.html
      format.csv { send_data @shots.to_csv, filename: 'StPaul_vaccinations.csv' }
    end
  end

  # GET /shots/1 or /shots/1.json
  def show; end

  # GET /shots/new
  def new
    @shot = Shot.new
    # @quantity = params[:quantity]
    # @party = params[:last_name]
  end

  # GET /shots/1/edit
  def edit; end

  # POST /shots or /shots.json
  def create
    @shot = Shot.new(shot_params)

    respond_to do |format|
      if @shot.save
        format.html { redirect_to @shot, notice: 'Vaccination reservation was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shots/1 or /shots/1.json
  def update
    respond_to do |format|
      if @shot.update(shot_params)
        format.html { redirect_to @shot, notice: 'Vaccination reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shots/1 or /shots/1.json
  def destroy
    @shot.destroy
    respond_to do |format|
      format.html { redirect_to shots_url, notice: 'Vaccination reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shot
    @shot = Shot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def shot_params
    params.require(:shot).permit(:last_name, :first_name, :dob, :email, :phone, :shot_time, :status, :honey)
  end

  def admin_only
    unless current_user.has_role?(:admin) || current_user.has_role?(:vvol)
      redirect_to root_path, alert: 'This information is private.'
    end
  end
end
