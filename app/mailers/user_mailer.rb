class UserMailer < ApplicationMailer
  default from: 'welcome@SaintPaulsNaples.org'

  def welcome_email(user)
    @user = user
    @url = 'http://SaintPaulsNaples.org/login'
    mail(to: @user.email, subject: "Welcome to Saint Pauls")
  end
end
