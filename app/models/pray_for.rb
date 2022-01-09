# == Schema Information
#
# Table name: pray_fors
#
#  id         :integer          not null, primary key
#  first_name :string
#  reason     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PrayFor < ApplicationRecord
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
end
