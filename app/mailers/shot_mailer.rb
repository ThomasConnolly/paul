class ShotMailer < ApplicationMailer
  def reminder(shot)
    @shot = shot
    mail( 
      to: -> { Shot.where.not(email: nil).pluck(:email) }, 
      subject: 'Reminder about your vaccination'
    )
  end
end
