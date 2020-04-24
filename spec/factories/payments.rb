FactoryBot.define do
  factory :payment do
    user { nil }
    donations { nil }
    amount { 1 }
    card_id { "MyString" }
    stripe_id { "MyString" }
  end
end
