# frozen_string_literal: true

module BirthdaysHelper
  def birthdays_this_week
    Member.find_birthdays_for(Date.today-7,
                              Date.today+7).order(:birthday.strftime('%m%d'))
  end
end