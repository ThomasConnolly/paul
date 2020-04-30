# frozen_string_literal: true

# == Schema Information
#
# Table name: donations
#
#  id            :bigint           not null, primary key
#  amount        :integer
#  dollars       :integer
#  stripe_intent :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_donations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Donation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
