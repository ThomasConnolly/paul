# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `MinutesMailer`.
# Please instead update this file by running `bin/tapioca dsl MinutesMailer`.

class MinutesMailer
  class << self
    sig { params(vestry_minute: T.untyped).returns(::ActionMailer::MessageDelivery) }
    def new_minutes_email(vestry_minute); end
  end
end
