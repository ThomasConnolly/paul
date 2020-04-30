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
#  donation_id    :bigint           not null
#  stripe_id      :string
#  user_id        :bigint           not null
#
# Indexes
#
#  index_payments_on_donation_id  (donation_id)
#  index_payments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (donation_id => donations.id)
#  fk_rails_...  (user_id => users.id)
#
class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :donations
end
