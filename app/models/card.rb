# == Schema Information
#
# Table name: cards
#
#  id             :bigint           not null, primary key
#  card_brand     :string
#  card_exp_month :string
#  card_exp_year  :string
#  card_last4     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  donation_id    :bigint           not null
#  stripe_id      :string
#  user_id        :bigint           not null
#
# Indexes
#
#  index_cards_on_donation_id  (donation_id)
#  index_cards_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (donation_id => donations.id)
#  fk_rails_...  (user_id => users.id)
#
class Card < ApplicationRecord
  belongs_to :donation
  belongs_to :user, optional: true
end
