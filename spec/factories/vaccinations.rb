# == Schema Information
#
# Table name: vaccinations
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  phone      :string
#  status     :string
#  time       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :vaccination do
    time { "MyString" }
    status { "MyString" }
    last_name { "MyString" }
    first_name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
  end
end
