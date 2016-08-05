# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview
  def member_survey_email
    MemberMailer.member_survey(Member.first)
  end
end
