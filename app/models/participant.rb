# == Schema Information
#
# Table name: participants
#
#  id                    :bigint           not null, primary key
#  email                 :string
#  first_name            :string
#  first_preferred_day   :string
#  first_preferred_time  :string
#  honey                 :string
#  last_name             :string
#  second_preferred_day  :string
#  second_preferred_time :string
#  session               :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Participant < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
end
