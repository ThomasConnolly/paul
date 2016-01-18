class WelcomeVestryMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Welcome to Saint Paul's website")
  end
end