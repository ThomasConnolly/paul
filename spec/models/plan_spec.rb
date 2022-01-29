# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id             :bigint           not null, primary key
#  amount         :integer
#  interval       :string
#  interval_count :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stripe_id      :string
#
require 'rails_helper'

RSpec.describe Plan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
