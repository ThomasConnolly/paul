# == Schema Information
#
# Table name: pathways
#
#  id         :bigint           not null, primary key
#  image      :string
#  link       :string
#  pubdate    :date
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
