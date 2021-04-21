# == Schema Information
#
# Table name: shots
#
#  id         :bigint           not null, primary key
#  dob        :date
#  email      :string
#  first_name :string
#  honey      :string
#  last_name  :string
#  phone      :string
#  shot_time  :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :shot do
    last_name { "MyString" }
    first_name { "MyString" }
    dob { "2021-04-18" }
    email { "MyString" }
    phone { "MyString" }
    time { "MyString" }
    status { "MyString" }
    honey { "MyString" }
  end
end
