# frozen_string_literal: true

FactoryBot.define do
  factory :en do
    title { 'MyString' }
    summary { 'MyText' }
    url { 'MyString' }
    published_at { '2020-11-17' }
    guid { 'MyString' }
  end
end
