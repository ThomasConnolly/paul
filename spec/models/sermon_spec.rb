require 'rails_helper'

RSpec.describe Sermon, type: :model do
  it "has a valid factory" do
    expect(sermon).to be_valid
  end
end

describe Sermon do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:cites) }
  it { is_expected.to validate_presence_of(:sermon_body) }
end