# frozen_string_literal: true

class StripeMailer < ApplicationMailer
  
  default to: 'tom.connolly@comcast.net'

  def stripe_report_created(stripe_report)
    @stripe_report = stripe_report
    @url = 'https://www.saintpaulsnaples.org/stripe_reports/stripe_report_id'
  end
end
