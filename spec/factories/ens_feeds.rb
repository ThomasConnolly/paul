# == Schema Information
#
# Table name: ens_feeds
#
#  id           :bigint           not null, primary key
#  link         :text
#  published_at :datetime
#  summary      :text
#  title        :string
#  url          :string
#  uuid         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :ens_feed do
    title { "MyString" }
    summary { "MyText" }
    url { "MyString" }
    published_at { "2020-11-17 11:35:40" }
    uuid { "MyString" }
  end
end
