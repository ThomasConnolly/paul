class MemberMailer < ApplicationMailer
  default from: "Father Bill <FrBill@saintpaulsnaples.org>"

   def member_survey(member)
    @member = member
    @url = "https://saintpaulsnaples.org/surveys"
    mail(subject: "Take the parish survey")
  end

  def member_prayer(member)
    @member = member
    @url = "https://saintpaulsnaples.org/prayers"
    mail(
      bcc: Proc.new { Member.pluck(:email).uniq },
      subject: "Pray with your Church this Holy Week")
  end
end