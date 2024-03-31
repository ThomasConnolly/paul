# frozen_string_literal: true

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
