# frozen_string_literal: true

# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  amount     :integer
#  end_date   :date
#  plan       :string
#  start_date :date
#  status     :string
#  created_at :datetime
#  updated_at :datetime
#  plan_id    :string           default("prod_ETteQ8s9Ho9sNW")
#  stripe_id  :string
#  user_id    :integer
#

class Pledge < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { only_integer: true }
  validates_presence_of :user_id
  before_save :set_plan_id

  #these are for production
#   def set_plan_id
    
#     self.plan_id = 'plan_HGF5TFwu6CExEc' if plan == "quarterly"
#     self.plan_id = 'plan_HGF3HFRRZXQ1vS' if plan == "monthly"
#     self.plan_id = 'plan_HGF4nSEWQx4NPv'  if plan == "weekly"
#     end
# end

#these are for test mode
def set_plan_id
    
  self.plan_id = 'plan_HCxxRCehGf5Pog' if plan == "quarterly"
  self.plan_id = 'plan_HCxus7BSYo1eSh' if plan == "monthly"
  self.plan_id = 'plan_HCxvLz92uVgU3a'  if plan == "weekly"
  end
end
