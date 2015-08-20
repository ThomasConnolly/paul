class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.save
      WelcomeMailer.welcome_email(@user).deliver_now
    else
      render 'new'
    end
  end
end