# == Schema Information
#
# Table name: children
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :child do
    first_name { "MyString" }
    last_name { "MyString" }
    birthday { "2020-04-24" }
  end
end
