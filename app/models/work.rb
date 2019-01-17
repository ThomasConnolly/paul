# == Schema Information
#
# Table name: works
#
#  id         :bigint(8)        not null, primary key
#  my_act     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Work < ApplicationRecord
  validates_presence_of :my_act
  #honey used to prevent bots-filled forms from being saved to db
  validates :honey, length: { is: 0 }
end
