# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `WelcomeMailer`.
# Please instead update this file by running `bin/tapioca dsl WelcomeMailer`.

class WelcomeMailer
  class << self
    sig { params(user: T.untyped).returns(::ActionMailer::MessageDelivery) }
    def welcome_email(user); end
  end
end
