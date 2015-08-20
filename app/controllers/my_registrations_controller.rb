class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
      WelcomeMailer.welcome_email(@user).deliver unless @user.invalid?
  end
end