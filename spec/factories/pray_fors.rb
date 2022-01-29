# frozen_string_literal: true

# == Schema Information
#
# Table name: pray_fors
#
#  id         :integer          not null, primary key
#  first_name :string
#  reason     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :pray_for do
    first_name { 'MyString' }
    reason { 'MyString' }
  end
end
