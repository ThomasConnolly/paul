# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  stripe_id  :string
#  amount     :integer
#  dollars    :integer
#  status     :string
#  memo       :string
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#

FactoryBot.define do
  factory :donation do
    user { '' }
    amount { 1 }
    type { '' }
    stripe_email { 'MyString' }
    stripe_plan { 'MyString' }
  end
end
