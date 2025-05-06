# typed: true
# frozen_string_literal: true

class TestMailer < ApplicationMailer
  def testing
    mail(
      to: 'tom.connolly@comcast.net',
      subject: 'just a test'
    )
  end
end 
# run this in Heroku console
# TestMailer.testing.deliver_later
