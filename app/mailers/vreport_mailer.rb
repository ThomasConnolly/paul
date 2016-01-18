class VreportMailer < ApplicationMailer
  
  def vreport_created(vreport)
    @current_user = current_user
    @vreport_user = vreport_user

    mail(to: @user.vestry.email,
         subject: "There's a new vestry report for you to read."
         )
  end
end