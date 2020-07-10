
module BirthdaysHelper
  def birthdays_this_week
    Member.find_birthdays_for(Date.today.beginning_of_week,
                              Date.today.end_of_week).order(:birthday.strftime ('%m%d'))
  end
end