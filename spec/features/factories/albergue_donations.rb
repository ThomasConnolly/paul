FactoryBot.define do
  factory :albergue_donation do
    user { nil }
    plan { "MyString" }
    stripe_plan { "MyString" }
    stripe_email { "MyString" }
    anonymous { false }
  end
end
