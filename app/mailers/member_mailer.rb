class MemberMailer < ApplicationMailer
  default to: Proc.new { Member.pluck([:email, :full_name]) },
   from: ("Father Bill <FrBill@saintpaulsnaples.org>")
  

  def member_survey(member)
    @member = member
    @url = "http://saintpaulsnaples.org/surveys"
    #email_with_name = %("#{@member.full_name}" <#{@member.email}>)
    #mail(to: email_with_name, subject: "Take the parish survey")
    mail(to: @member.email, subject: "Take the parish survey")
  end
end
