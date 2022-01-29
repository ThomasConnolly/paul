# frozen_string_literal: true

# == Schema Information
#
# Table name: cards
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  donation_id    :integer          not null
#  card_brand     :string
#  card_last4     :string
#  card_exp_month :string
#  card_exp_year  :string
#  stripe_id      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_cards_on_donation_id  (donation_id)
#  index_cards_on_user_id      (user_id)
#

class Card < ApplicationRecord
  belongs_to :donation
  belongs_to :user, optional: true
end
