class VestryMailer < ApplicationMailer
  default to: Proc.new { User.vestry.pluck(:email) }
  
  def vreport_created(vreport)
    @vreport = vreport
    @url = "http://saintpaulsnaples.org"
    mail(subject: "There's a new vestry report for you to read.")
  end  
end
