# == Schema Information
#
# Table name: donations
#
#  id              :bigint           not null, primary key
#  amount          :integer
#  dollars         :integer
#  status          :string
#  stripe_customer :string
#  type            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :donation do
    user { "" }
    amount { 1 }
    type { "" }
    stripe_email { "MyString" }
    stripe_plan { "MyString" }
  end
end
