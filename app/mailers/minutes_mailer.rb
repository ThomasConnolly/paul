class MinutesMailer < ApplicationMailer
  def new_minutes_email(vestry_minute)
    @vestry_minute = vestry_minute
    @url = url_for(@vestry_minute)
    mail(
      to: User.where('? = ANY(roles)', 'vestry').pluck(:email),
      subject: 'Meeting minutes draft posted for you.'
    )
  end
end
