# frozen_string_literal: true

class VestryMinutesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_vestry_minute, only: %i[show edit update destroy]
  before_action :admin_only, except: %i[index show]

  # GET /vestry_minutes
  # GET /vestry_minutes.json
  def index
    @vestry_minutes = VestryMinute.all
  end

  # GET /vestry_minutes/1
  # GET /vestry_minutes/1.json
  def show; end

  # GET /vestry_minutes/new
  def new
    @vestry_minute = VestryMinute.new
  end

  # GET /vestry_minutes/1/edit
  def edit; end

  # POST /vestry_minutes
  # POST /vestry_minutes.json
  def create
    @vestry_minute = VestryMinute.new(vestry_minute_params)

    respond_to do |format|
      if @vestry_minute.save
        format.html { redirect_to @vestry_minute, notice: 'Vestry minutes successfully created.' }
        format.json { render :show, status: :created, location: @vestry_minute }
      else
        format.html { render :new }
        format.json { render json: @vestry_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vestry_minutes/1
  # PATCH/PUT /vestry_minutes/1.json
  def update
    respond_to do |format|
      if @vestry_minute.update(vestry_minute_params)
        format.html { redirect_to @vestry_minute, notice: 'Vestry minutes successfully updated.' }
        format.json { render :show, status: :ok, location: @vestry_minute }
      else
        format.html { render :edit }
        format.json { render json: @vestry_minute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vestry_minutes/1
  # DELETE /vestry_minutes/1.json
  def destroy
    @vestry_minute.destroy
    respond_to do |format|
      format.html { redirect_to vestry_minutes_url, notice: 'Vestry minutes successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vestry_minute
    @vestry_minute = VestryMinute.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vestry_minute_params
    params.require(:vestry_minute).permit(:date, :minutes, :body)
  end

  def admin_only
    unless user_signed_in && current_user.admin?
      redirect_to root_path, alert: 'You must be an administrator to perform this function.'
    end
  end
end
