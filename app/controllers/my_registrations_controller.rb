class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
      WelcomeMailer.welcome_email(resource).deliver unless resource.invalid?
  end
end
