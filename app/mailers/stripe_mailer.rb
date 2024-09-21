# typed: true
# frozen_string_literal: true

class StripeMailer < ApplicationMailer
  default from: 'webmaster@saintpaulsnaples.org'

  def send_report(stripe_report)
    @stripe_report = stripe_report
    @url = stripe_report_url(@stripe_report)
    mail(
      to: 'accountant@SaintPaulsNaples.org',
      bcc: 'tom.connolly@comcast.net',
      subject: 'A new activity at Stripe'
    ) do |format|
      format.html do
        render inline: <<-HTML
          <p>A new Stripe report is available at <%= @url %></p>
        HTML
      end
    end
  end
end
