# == Schema Information
#
# Table name: prayers
#
#  id             :integer          not null, primary key
#  day_of_prayer  :string
#  time_of_prayer :string
#  name           :string
#  honey          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pray_time      :integer
#

class Prayer < ApplicationRecord
  validates_presence_of [:day_of_prayer, :time_of_prayer] 
  validates :honey, absence: true
end
