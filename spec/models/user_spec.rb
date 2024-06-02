# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)
#  avatar                 :string
#  stripe_id              :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  roles                  :string           default(["\"member\""]), is an Array
#  personal               :string
#
# typed: false

# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'tedwardconnolly@gmail.com' }
  let(:invalid_email) { 'fake@example.com' } # replace with an email that Verifalia considers invalid

  it 'validates real emails' do
    user = User.new(email: valid_email, password: 'password', password_confirmation: 'password',
                    first_name: 'Joseph', last_name: 'Joyce')
    expect(user).to be_valid
  end

  it 'rejects fake emails' do
    user = User.new(email: invalid_email, password: 'password', password_confirmation: 'password',
                    first_name: 'Bonnie', last_name: 'Bennett')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('must be a real email address')
  end
end
