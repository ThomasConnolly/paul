# == Schema Information
#
# Table name: subscriptions
#
#  id                  :bigint           not null, primary key
#  active              :boolean          default(TRUE)
#  current_period_ends :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  plan_id             :string
#  pledge_id           :string
#  stripe_id           :string
#  user_id             :string
#
require 'rails_helper'

RSpec.describe Subscription, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
