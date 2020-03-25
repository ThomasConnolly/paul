FactoryBot.define do
  factory :comment do
    user { nil }
    commentable { nil }
    parent_id { 1 }
  end
end
