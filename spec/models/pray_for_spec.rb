# == Schema Information
#
# Table name: pray_fors
#
#  id         :bigint           not null, primary key
#  first_name :string
#  honey      :string
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe PrayFor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
