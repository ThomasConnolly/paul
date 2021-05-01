class ShotMailer < ApplicationMailer
  def reminder(shot)
    @shot = shot
    @shot.first_name = shot.first_name
    @shot.last_name = shot.last_name
    @shot.shot_time = shot.shot_time
    mail( 
      to: -> { Shot.where.not(email: nil).pluck(:email) }, 
      subject: 'Reminder about your vaccination'
    )
  end
end
