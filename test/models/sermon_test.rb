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

require 'test_helper'

class SermonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
