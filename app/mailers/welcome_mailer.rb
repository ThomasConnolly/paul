class WelcomeMailer < ApplicationMailer

  def send_welcome_email(user)
    @user = user
    @url = 'http://saintpaulsnaples.org'
    mail(to: @user.email,
         subject: 'Welcome to Saint Paul\'s website')
  end
end