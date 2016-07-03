# == Schema Information
#
# Table name: vestry_minutes
#
#  id         :integer          not null, primary key
#  date       :date
#  minutes    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :vestry_minute do
    date "2016-05-25 14:36:15"
    minutes "MyText"
  end
end
