class VestryMailer < ApplicationMailer
  default to: "tom.connolly@comcast.net"
  #Proc.new { User.vestry.pluck(:email) },
          #bcc: Proc.new {User.admin.pluck(:email) }

  
  def vreport_created(vreport)
    @vreport = vreport
    @url = "http://saintpaulsnaples.org"
    mail(subject: "There's a new vestry report for you to read.")
  end  
end
