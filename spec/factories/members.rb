# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  anniversary   :date
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  full_name     :string
#

FactoryGirl.define do
  factory :member do
    last_name "MyString"
first_name "MyString"
email "MyString"
anniversary "2016-01-25"
birthday "2016-01-25"
  end

end
