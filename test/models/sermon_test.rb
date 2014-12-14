# == Schema Information
#
# Table name: sermons
#
#  id           :integer          not null, primary key
#  delivered_on :date
#  homilist     :integer
#  title        :string(255)
#  cites        :string(255)
#  sermon_body  :text
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class SermonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
