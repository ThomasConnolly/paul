# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  avatar                 :string
#  card_brand             :string
#  card_exp_month         :string
#  card_exp_year          :string
#  card_last4             :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)
#  honey                  :string
#  last_name              :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  username               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the username for a user' do
    user = User.create(first_name: "Chipper", last_name: "Bear")

    expect.(user.username.to eq "Chipper Smith")
  end
end
