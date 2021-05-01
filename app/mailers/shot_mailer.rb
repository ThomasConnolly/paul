class ShotMailer < ApplicationMailer
  def reminder(shot)
    @shot = shot
    mail( 
      to: shot.email, 
      subject: 'Reminder about your vaccination'
    )
  end
end
