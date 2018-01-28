class MemberMailer < ApplicationMailer
  default from: "Father Bill <FrBill@saintpaulsnaples.org>"
  default  to: Proc.new { Member.pluck(:email)}


   def member_survey(member)
    @member = member
    @url = "https://saintpaulsnaples.org/surveys"
    mail(subject: "Take the parish survey")
  end

  def member_prayer(member)
    @member = member
    @url = "https://saintpaulsnaples.org/prayers"
    mail(
      subject: "Pray with your Church this Holy Week")
  end

  def member_work(member)
    @member = member
    @url = "https://saintpaulsnaples.org/pages/grace_works"
    mail(
      subject: "We wish to celebrate your good works")
  end
end

#instructions on sending the email for surveys:
#launch rails console

#MemberMailer.member_survey(@member).deliver_later
#That's it!
