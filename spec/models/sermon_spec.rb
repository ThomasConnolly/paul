# == Schema Information
#
# Table name: sermons
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  cites        :string(255)
#  sermon_body  :text
#  created_at   :datetime
#  updated_at   :datetime
#  homilist_id  :integer
#  delivered_on :date
#

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
