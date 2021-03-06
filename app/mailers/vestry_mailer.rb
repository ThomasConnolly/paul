# frozen_string_literal: true

class VestryMailer < ApplicationMailer
  default to: proc { User.with_role(:vestry).pluck(:email) },
          bcc: proc { User.with_role(:admin).pluck(:email) }

  def vreport_created(vreport)
    @vreport = vreport
    @vreport_id = vreport.id
    @url = url_for(@vreport)
    mail(subject: "There's a new vestry report for you to read.")
  end
end
