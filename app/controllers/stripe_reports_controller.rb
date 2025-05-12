# typed: false
# frozen_string_literal: true

class StripeReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_stripe_report, only: :show

  respond_to :html, :js

  def index
    @stripe_reports = StripeReport.all
  end

  def show; end

  def new
    @stripe_report = StripeReport.new
  end

  def create
    @stripe_report = StripeReport.new(stripe_report_params)
    if @stripe_report.save
      redirect_to '/'
    else
      render :new
    end
  end

  private

  def set_stripe_report
    @stripe_report = StripeReport.find(params[:id])
  end

  def stripe_report_params
    params.expect(stripe_report: %i[date amount stripe_fee net donor_name
                                    webhook_id])
  end

  def admin_only
    return if user_signed_in? && current_user.roles.include?('admin')

    redirect_to(root_path,
                alert: 'This information is private.')
  end
end
