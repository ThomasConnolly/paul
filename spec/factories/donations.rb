FactoryBot.define do
  factory :donation do
    type { "" }
    amount { 1 }
    pay_this { 1 }
    user { nil }
    anonymous { false }
  end
end
