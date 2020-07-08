# frozen_string_literal: true
module MembersHelper
  def birthdays_this_week
    Member.find_birthdays_for(Date.today.beginning_of_week(start_day = :sunday),
                              Date.today.end_of_week(start_day = :sunday)).order(:yday)
  end
end



# CSV.foreach(file, col_sep: ';', headers: true) do |row|
#   data = row.to_h.transform_keys(&:strip)
#   birthday = Date.parse("2020-#{data['month']}-#{data['day']}")
# end