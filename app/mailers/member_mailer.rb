# frozen_string_literal: true

# instructions on sending the email for surveys:
# launch rails console

# MemberMailer.member_survey(@member).deliver_later
# That's it!

class MemberMailer < ApplicationMailer
 
  default from: 'Welcome@saintpaulsnaples.org'
  default to: 'tom.connolly@comcast.net'
  default bcc: proc { Member.where.not(email: nil).pluck(:email) }
  
  def test(member)
    @member = member
    mail(
      subject: 'testing'
    )
  end
  # def fall2019(member)
  #   @member = Member


  def holyWeek2019_pathway(member)
    @member = member
    @url = 'https://s3-us-west-2.amazonaws.com/saintpaulsnaplesorg/HolyWeek2019Smr.pdf'
    mail(
      subject: 'New Pathway, the parish newsletter'
    )
  end
  
  def lent2019_pathway(member)
    @member = member
    @url = 'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1551804571/LentSmall2019_imqi3p.pdf'
    mail(
      subject: 'New Pathway, the parish newsletter'
    )
  end

  def january2019_pathway(member)
    @member = member
    @url =  'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1548946906/Jan2019Com_zwvih3.pdf'
    mail(
      subject: 'New Pathway, the parish newsletter'
    )
  end

  def december_pathway(member)
    @member = member
    @url = 'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1543942565/December2018F_ifekfm.pdf'
    mail(
      subject: 'New Pathway newsletter'
    )
  end

  def member_meet_rector_elect(member)
    @member = member
    @url = 'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1535993745/FrTomSmall_ftq4hq.pdf'
    mail(
      subject: 'Meet our rector-elect'
    )
  end

  def member_prayer(member)
    @member = member
    @url = 'https://saintpaulsnaples.org/prayers'
    mail(
      subject: 'Pray with your Church this Holy Week'
    )
  end

  def member_work(member)
    @member = member
    @url = 'https://saintpaulsnaples.org/pages/grace_works'
    mail(
      subject: 'We wish to celebrate your good works'
    )
  end
end
