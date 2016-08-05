class MemberMailer < ApplicationMailer
  default to: Proc.new { Member.pluck(:email) },
        from: ("Father Bill <FrBill@saintpaulsnaples.org>")
  

  def member_survey(member)
    @member = member
    @url = "http://saintpaulsnaples.org/"
    email_with_name = %("#{@member.full_name}"" <#{@member.email}>)
    mail(to: email_with_name, subject: "Take the parish survey")
  end
end
