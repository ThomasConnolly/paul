# == Schema Information
#
# Table name: albergue_children
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :albergue_child do
    first_name { "MyString" }
    last_name { "MyString" }
    user { nil }
    avatar { "MyString" }
    birthday { "2020-04-25" }
  end
end
