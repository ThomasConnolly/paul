# == Schema Information
#
# Table name: donations
#
#  id           :bigint(8)        not null, primary key
#  user_id      :bigint(8)
#  amount       :integer          default(275)
#  pay_this     :integer
#  anonymous    :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  stripe_email :string
#  customer_id  :string
#  source       :string
#  name         :string
#  address      :string
#  city         :string
#  zip          :string
#

class AlbergueDonation < ApplicationRecord
  belongs_to :user
end
