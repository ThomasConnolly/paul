# == Schema Information
#
# Table name: homilists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Homilist < ActiveRecord::Base
  has_many :sermons
  validates_presence_of :name
end
