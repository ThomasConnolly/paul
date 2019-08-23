# frozen_string_literal: true

FactoryBot.define do
  factory :stripe_plan do
    plan { 'MyString' }
  end
end
