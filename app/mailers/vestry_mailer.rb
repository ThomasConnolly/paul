# frozen_string_literal: true

class VestryMailer < ApplicationMailer
  default to: proc { User.where(role: "vestry").pluck(:email) },
          bcc: proc { User.where(role: "admin").pluck(:email) }

  def vreport_created(vreport)
    @vreport = vreport
    @vreport_id = vreport.id
    @url = url_for(@vreport)
    mail(subject: "There's a new vestry report for you to read.")
  end
end
