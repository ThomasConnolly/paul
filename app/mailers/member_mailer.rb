# frozen_string_literal: true

# instructions on sending the email for surveys:
# launch rails console

# MemberMailer.member_survey(@member).deliver_later
# That's it!

class MemberMailer < ApplicationMailer
 
  default from: 'Welcome@saintpaulsnaples.org'
  default to: 'welcome@saintpaulsnaples.org'
  default bcc: -> { Member.where.not(email: nil).pluck(:email) }
  
  def test(member)
    @member = member
    mail(
      subject: 'testing'
    )
  end
  def may2021_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1620354103/MaySm2021_iljhdh.pdf"
    mail(
      subject: "Pathways, your parish newsletter"
    )
  end
    
  def pathways_link(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1615645774/lentSm2021_ska6qh.pdf"
    mail(
      subject: 'Trouble getting Pathways?'
    )
  end

  def lent2021_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1615645774/lentSm2021_ska6qh.pdf"
    mail(
      subject: "Pathways, your parish newsletter"
    )
  end

  def winter2020_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1608566037/December2020_ubsxck.pdf"
    mail(
      subject: "The latest Pathway, the St. Paul parish newsletter, for you"
    )
  end

  def thankfuls(member)
    @member = member
    @url = "https://www.saintpaulsnaples.org"
    mail(
      subject: "We want your note of thanks for Thursday's liturgy"
    )
  end
  
  def fall2020_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1602860222/OctSm_vdmje5.pdf"
    mail(
      subject: "The latest Pathway, the St. Paul parish newsletter, for you"
    )
  end

  def wedding2(member)
    @member = member
    mail(
      subject: "A wedding at St. Paul's"
    )
  end

  def midSummer2020_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1596816752/Aug2020Sm_ofmerc.pdf"
    mail(
      subject: "The latest Pathway, the St. Paul parish newsletter, for you"
    )
  end

  def summer2020_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1591980296/summer_r8otjd.pdf"
    mail(
      subject: "A new Pathway, the St. Paul parish newsletter, for you"
    )
  end
  def holy_week_2020_pathway(member)
    @member = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/q_100/v1586024909/HolyWeek20_mihkbp.pdf"
    mail(
      subject: "A new Pathway, the St. Paul parish newsletter, for you"
    )
  end

  def mar2020_pathway(member)
    @meber = member
    @url = "https://res.cloudinary.com/saintpaulsnaples-org/image/upload/v1583598830/March2020S_uwawdz.pdf"
    mail(
      subject: "A new Pathway, the parish newsletter, for you"
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
