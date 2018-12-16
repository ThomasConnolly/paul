class MemberMailer < ApplicationMailer
  default from: "Welcome@saintpaulsnaples.org"
  default  bc: Proc.new { Member.pluck(:email)}

  def december_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1543942565/December2018F_ifekfm.pdf"
    mail(
      subject: "New Pathway newsletter")
  end

  def member_meet_rector_elect(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1535993745/FrTomSmall_ftq4hq.pdf"
    mail(
      subject: "Meet our rector-elect")
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
