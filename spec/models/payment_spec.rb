# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id             :bigint           not null, primary key
#  card_brand     :string
#  card_exp_month :string
#  card_exp_year  :string
#  card_last4     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stripe_id      :string
#
require 'rails_helper'

RSpec.describe Payment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
