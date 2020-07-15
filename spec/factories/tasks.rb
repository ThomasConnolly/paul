# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  deadline    :string
#  description :string
#  position    :integer
#  title       :string
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
