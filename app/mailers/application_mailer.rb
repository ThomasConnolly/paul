class ApplicationMailer < ActionMailer::Base
  default from: "welcome@saintpaulsnaples.org"
  layout 'mailer'
  @url = 'http://saintpaulsnaples.org'
end
