# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/minutes_mailer
class MinutesMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/minutes_mailer/new_vestry_minutes_email
  def new_vestry_minutes_email
    MinutesMailer.new_vestry_minutes_email
  end
end
