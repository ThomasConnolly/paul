# frozen_string_literal: true
module MembersHelper
  def birthdays_this_week
    Member.find_birthdays_for(Date.today.beginning_of_week(start_day = :sunday),
                              Date.today.end_of_week(start_day = :sunday)).order(:birthday)
  end
end
