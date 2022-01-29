# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  event      :string
#  time       :string
#  date       :datetime
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :link do
    event { 'MyString' }
    time { 'MyString' }
    date { '2020-05-24 09:36:41' }
    url { 'MyString' }
  end
end
