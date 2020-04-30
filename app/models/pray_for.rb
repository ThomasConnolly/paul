# == Schema Information
#
# Table name: pray_fors
#
#  id         :bigint           not null, primary key
#  first_name :string
#  honey      :string
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PrayFor < ApplicationRecord
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
end
