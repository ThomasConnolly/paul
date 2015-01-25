# == Schema Information
#
# Table name: opportunities
#
#  id         :integer          not null, primary key
#  ministry   :string(255)
#  who        :string(255)
#  what       :string(255)
#  when       :string(255)
#  where      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class OpportunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
