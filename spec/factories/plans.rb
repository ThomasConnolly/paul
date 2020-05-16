# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  amount         :integer
#  interval       :string
#  interval_count :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stripe_id      :string
#
FactoryBot.define do
  factory :plan do
    name { "MyString" }
    amount { 1 }
    interval { "MyString" }
    interval_count { "MyString" }
    stripe_id { "MyString" }
  end
end
