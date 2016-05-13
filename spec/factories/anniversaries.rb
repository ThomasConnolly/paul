# == Schema Information
#
# Table name: anniversaries
#
#  id          :integer          not null, primary key
#  salutation  :string
#  last_name   :string
#  anniversary :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :anniversary do
    salutation "MyString"
    last_name "MyString"
    anniversary "2016-04-08"
  end
end
