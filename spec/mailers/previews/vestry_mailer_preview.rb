# Preview all emails at http://localhost:3000/rails/mailers/vestry_mailer
class VestryMailerPreview < ActionMailer::Preview
  def new_vreport
    vreport=Vreport.first
    VestryMailer.vreport_created(vreport)
  end
end
