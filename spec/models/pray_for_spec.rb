# frozen_string_literal: true

# == Schema Information
#
# Table name: pray_fors
#
#  id         :integer          not null, primary key
#  first_name :string
#  reason     :string
#  honey      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe PrayFor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
