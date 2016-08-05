class ApplicationMailer < ActionMailer::Base
  include SendGrid
  
  default from: "NoResponse@SaintPaulsNaples.org"
  layout 'mailer'
end
