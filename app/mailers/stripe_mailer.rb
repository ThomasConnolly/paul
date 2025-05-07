# typed: true
# frozen_string_literal: true

class StripeMailer < ApplicationMailer
  default from: 'webmaster@saintpaulsnaples.org'

  def stripe_report(stripe_report_id)
    @stripe_report = stripe_report_id.is_a?(Integer) ? 
      StripeReport.find(stripe_report_id) : stripe_report_id
    mail(
      to: 'accountant@SaintPaulsNaples.org',
      bcc: 'tom.connolly@comcast.net',
      subject: 'A new Stripe report for you'
    )
  end
end
