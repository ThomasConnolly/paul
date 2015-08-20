class WelcomeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome_mailer/welcome_email
  def welcome_email
    user = User.last
    WelcomeMailer.welcome_email(user)
  end

end
