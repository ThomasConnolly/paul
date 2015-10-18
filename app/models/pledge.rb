# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :integer
#  divisor    :integer
#  pay_this   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Pledge < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :amount
  validates_presence_of :user_id
end
