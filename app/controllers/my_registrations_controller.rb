class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      WelcomeMailer.send_welcome_email(@user).deliver
    else
      render :action => 'new'
    end
  end
end