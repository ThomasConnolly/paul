# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  event      :string
#  time       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :link do
    event { "MyString" }
    time { "MyString" }
    date { "2020-05-24 09:36:41" }
    url { "MyString" }
  end
end
