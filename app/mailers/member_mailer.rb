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
  
  def Feb2020_pathway(member)
    @member = Member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1581604526/Feb2020Web_iyezxj.pdf"
    mail(
      subject: "St. Paul's parish newsletter, Pathway"
    )
  end
  
  def Jan2020_pathway(member)
    @member = Member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1579145131/Jan2020_tkbja1.pdf"
    mail(
      subject: "New Pathway, the parish newsletter"
    )
  end

  def december2019(member)
    @member = Member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1576342342/Xmas_cvml0v.pdf"
    mail(
      subject: 'New Pathway, the parish newsletter'
    )
  end


  def november2019(member)
    @member = member
    @url = 'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1573301967/Nov2019S_so4ixd.pdf'
    mail(
      subject: 'cl_image_tag("Xmas_cvml0v.jpgNew Pathway, the parish newsletter'
    )
  end

   def october2019(member)
     @member = member
     @url = 'https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1570583126/Oct2019_h7ingj.pdf'
     mail(
       subject: 'New Pathway, the parish newsletter'
     )
   end

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
