# frozen_string_literal: true

class VestryMailer < ApplicationMailer
  default to: proc { User.where(role: 'vestry').pluck(:email) },
          bcc: proc { User.where(role: 'admin').pluck(:email) }

  def vnote_created(vnote)
    @vnote = vnote
    @vnote_id = vnote.id
    @url = url_for(@vnote)
    mail(subject: "There's a new vestry report for you to read.")
  end
end
