# frozen_string_literal: true
# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  stripe_id  :string
#  amount     :integer
#  dollars    :integer
#  status     :string
#  memo       :string
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Donation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
