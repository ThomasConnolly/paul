# == Schema Information
#
# Table name: opportunities
#
#  id         :integer          not null, primary key
#  ministry   :string(255)
#  who        :string(255)
#  what       :string(255)
#  when       :string(255)
#  where      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Opportunity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :ministry
end
