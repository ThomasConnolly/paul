# frozen_string_literal: true
# example send email to all members from cli:
# MemberMailer.member_work(@member).deliver_later
# or
# MemberMailer.member_survey(@member).deliver_later
# That's it!


class ApplicationMailer < ActionMailer::Base
  default from: "St. Paul's" <NoResponse@SaintPaulsNaples.org>
  layout 'mailer'
end
