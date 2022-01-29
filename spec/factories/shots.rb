# frozen_string_literal: true

# == Schema Information
#
# Table name: shots
#
#  id         :integer          not null, primary key
#  last_name  :string
#  first_name :string
#  dob        :date
#  email      :string
#  phone      :string
#  shot_time  :string
#  status     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :shot do
    last_name { 'MyString' }
    first_name { 'MyString' }
    dob { '2021-04-18' }
    email { 'MyString' }
    phone { 'MyString' }
    time { 'MyString' }
    status { 'MyString' }
    honey { 'MyString' }
  end
end
