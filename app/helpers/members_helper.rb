# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  anniversary   :date
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  full_name     :string
#

module MembersHelper
  def birthdays_this_week
    Member.find_birthdays_for(Date.today.beginning_of_week-1,  
      Date.today.end_of_week-1).order(:birthday)
  end
end
