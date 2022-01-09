# == Schema Information
#
# Table name: pathways
#
#  id         :integer          not null, primary key
#  image      :string
#  pubdate    :date
#  link       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :pathway do
    image { "MyString" }
    title { "MyString" }
    link { "MyString" }
  end
end
