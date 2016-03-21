class VreportMailer < ApplicationMailer
  default to: Proc.new { User.vestry.pluck(:email) }
         
  
  def vreport_created(vreport)
    @vreport = vreport
    #@vreport_user = vreport.user
    mail(subject: "There's a new vestry report for you to read.")
  end
end

