# == Schema Information
#
# Table name: participants
#
#  id                    :bigint           not null, primary key
#  first_preferred_day   :string
#  first_preferred_time  :string
#  second_preferred_day  :string
#  second_preferred_time :string
#  session               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :integer
#
class Participant < ApplicationRecord
  belongs_to :user
end
