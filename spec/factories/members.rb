# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  individual :string
#  email      :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :member do
    first_name "MyString"
    last_name "MyString"
    individual "MyString"
    email "MyString"
    birthday "2016-07-13"
  end
end
