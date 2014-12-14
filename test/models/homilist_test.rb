# == Schema Information
#
# Table name: homilists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  photo      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class HomilistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
