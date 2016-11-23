# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  title             :string
#  price             :integer
#  date              :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  ticket_quantity   :integer
#  tickets_sold      :integer
#  tickets_available :integer
#

class Event < ActiveRecord::Base
  has_many :tickets
  validates_presence_of :title
  

end
