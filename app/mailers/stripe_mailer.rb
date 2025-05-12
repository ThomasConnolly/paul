# typed: true
# frozen_string_literal: true

class StripeMailer < ApplicationMailer
  default from: 'webmaster@saintpaulsnaples.org'

  def stripe_report(stripe_report_id)
    @stripe_report = if stripe_report_id.is_a?(Integer)
                       StripeReport.find(stripe_report_id)
                     else
                       stripe_report_id
                     end
    mail(
      to: 'accountant@SaintPaulsNaples.org',
      bcc: 'tom.connolly@comcast.net',
      subject: 'A new Stripe report for you'
    )
  end
end
