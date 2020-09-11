class StripeReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only
  before_action :set_stripe_report, only: :show

  respond_to :html, :js

  def index
    @stripe_reports = StripeReport.all
  end

  def show; end



  private


  def set_stripe_report
    @stripe_report = stripe_report.find(params[:id])
  end

  def stripe_report_params
    params.require(:stripe_report).permit(:user, :amount, :fee, :net, :donation, :pledge)
  end

  def admin_only
    unless current_user.has_role?(:admin)
      redirect_to root_path, alert: 'The information is restricted to administrators.'
    end
  end
end
