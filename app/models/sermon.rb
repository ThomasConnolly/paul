# == Schema Information
#
# Table name: sermons
#
#  id           :integer          not null, primary key
#  delivered_on :date
#  title        :string(255)
#  cites        :string(255)
#  sermon_body  :text
#  created_at   :datetime
#  updated_at   :datetime
#  homilist_id  :integer
#

class Sermon < ActiveRecord::Base
  belongs_to :homilist
  validates_presence_of :title, :sermon_body, :delivered_on, :homilist_id
end
