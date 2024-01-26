# frozen_string_literal: true

class VnoteMailer < ApplicationMailer
  def vnote_created(vnote)
    @vnote = vnote
    @url = url_for(@vnote)
    mail(
      to: 'tom.connolly@comcast.net',
      subject: "There's a new topic on the vestry forum.")
  end
end

# to: User.where('? = ANY(roles)', 'vestry').pluck(:email),
