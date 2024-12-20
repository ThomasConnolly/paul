# typed: true
# frozen_string_literal: true

class StripeMailer < ApplicationMailer
  default from: 'webmaster@saintpaulsnaples.org'

  def stripe_report(stripe_report)
    @stripe_report = stripe_report
    mail(
      to: 'accountant@SaintPaulsNaples.org',
      bcc: 'tom.connolly@comcast.net',
      subject: 'A new Stripe report for you'
    )
  end
end
