class MemberMailer < ApplicationMailer
  default to: Proc.new { Member.pluck(:email) },
   from: ("Father Bill <FrBill@saintpaulsnaples.org>")
  

  def member_survey(member)
    @member = member
    @url = "http://saintpaulsnaples.org/surveys"
    mail(subject: "Take the parish survey")
  end
end
