# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: webhooks
#
#  id         :bigint           not null, primary key
#  event_id   :string
#  data       :json
#  status     :integer          default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Webhook < ApplicationRecord
  validates :event_type, presence: true
  validates :data, presence: true
  enum :status, { pending: 0, processed: 1, failed: 2 }
end
