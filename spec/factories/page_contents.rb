# frozen_string_literal: true

FactoryBot.define do
  factory :page_content do
    section { 'MyString' }
    title { 'MyString' }
    body { 'MyText' }
    active { false }
  end
end
