# frozen_string_literal: true

# == Schema Information
#
# Table name: subscriptions
#
#  id                  :bigint           not null, primary key
#  active              :boolean          default(TRUE)
#  current_period_ends :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  plan_id             :string
#  pledge_id           :string
#  stripe_id           :string
#  user_id             :string
#
FactoryBot.define do
  factory :subscription do
    plan_id { 'MyString' }
    user_id { 'MyString' }
    active { false }
    current_period_ends { '2020-05-22 14:36:17' }
    stripe_id { 'MyString' }
  end
end
