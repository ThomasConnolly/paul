# frozen_string_literal: true

FactoryBot.define do
  factory :pledger do
    last_name { 'MyString' }
    salutation { 'MyString' }
    address1 { 'MyString' }
    address2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    postal_code { 'MyString' }
    type { 1 }
    northern_city { 'MyString' }
  end
end
