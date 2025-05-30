# typed: false
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

  def show; end

  def new
    @vestry_minute = VestryMinute.new
  end

  def edit; end

  def create
    @vestry_minute = VestryMinute.new(vestry_minute_params)
    if @vestry_minute.save
      MinutesMailer.send_minutes_emails(@vestry_minute)
      redirect_to @vestry_minute, notice: 'Vestry minutes successfully created.'
    else
      render :new
    end
  end

  def update
    if @vestry_minute.update(vestry_minute_params)
      redirect_to(@vestry_minute,
                  notice: 'Vestry minutes successfully updated.')
    else
      render :new
    end
  end

  def destroy
    @vestry_minute.destroy
    redirect_to vestry_minutes_url, status: :see_other,
                                    notice: 'Vestry minutes successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vestry_minute
    @vestry_minute = VestryMinute.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the "permit" through.
  def vestry_minute_params
    params.expect(vestry_minute: %i[date body draft])
  end

  def admin_only
    return if user_signed_in? && current_user.roles.include?('admin')

    redirect_to(root_path,
                alert: 'You must be an administrator to perform this function.')
  end
end
