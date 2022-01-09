# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  deadline    :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyString" }
    deadline { "MyString" }
    position { 1 }
  end
end
