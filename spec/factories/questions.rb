# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  survey_id  :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :question do
    survey_id 1
    content "MyText"
  end
end
