class UserMailer < ActionMailer::Base
  default from: "welcome@saintpaulsnaples.org", to: { User.pluck(:email) } 

  def welcome_email(user)
    @user = user
    mail(to:@user.email, subject: "welcome")
  end
end