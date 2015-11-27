# == Schema Information
#
# Table name: vreports
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :vreport do
    title "MyString"
body "MyText"
  end

end
