require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns the username for a user' do
    user = User.create(first_name: "Chipper", last_name: "Bear")

    expect.(user.username.to eq "Chipper Smith")
  end
end
