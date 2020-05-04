# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  card_brand     :string
#  card_exp_month :string
#  card_exp_year  :string
#  card_last4     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stripe_id      :string
#
FactoryBot.define do
  factory :payment do
    user { nil }
    donations { nil }
    amount { 1 }
    card_id { "MyString" }
    stripe_id { "MyString" }
  end
end
