class UserMailer < ApplicationMailer
  def welcom_email(user)
    @user = user
    @url = 'http://SaintPaulsNaples.org/login'
    mail(to: @user.email subject: "Welcome to Saint Pauls")
  end
  end
end
