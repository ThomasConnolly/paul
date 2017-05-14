# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :integer
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quantity   :integer
#  amount     :integer
#  url        :string
#  time       :time
#

class Event < ApplicationRecord
  has_many :tickets
  has_attachment :event_picture
  validates_presence_of :title
  

end
