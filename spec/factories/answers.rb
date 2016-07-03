# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  question   :text
#  survey_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :answer do
    rake "MyString"
    db ""
  end
end
