# frozen_string_literal: true

# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  active     :boolean          default(TRUE)
#  amount     :integer
#  end_date   :date
#  plan       :string
#  start_date :date
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
  before_save :set_plan


  enum status: { inactive: 0, active: 1, cancelled: 2 }

  # Amount in whole dollars now translated to pennies. Payment at specified intervals (divisor) calculated.


  def set_plan
    if plan == "quarterly"
      puts.self.stripe_plan_id = "plan_HGF5TFwu6CExEc"
    elsif plan == "monthly"
      puts self.plan = 'plan_HGF3HFRRZXQ1vS'
    else
      puts self.plan = 'plan_HGF4nSEWQx4NPv'
    end
  end

end
