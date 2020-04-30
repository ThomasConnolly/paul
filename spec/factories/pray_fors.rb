# == Schema Information
#
# Table name: pray_fors
#
#  id         :bigint           not null, primary key
#  first_name :string
#  honey      :string
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :pray_for do
    first_name { "MyString" }
    reason { "MyString" }
  end
end
