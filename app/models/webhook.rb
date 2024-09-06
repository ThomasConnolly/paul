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
  validates :event_id, presence: true, uniqueness: true
  validates :data, presence: true
  enum :status, { pending: 0, processing: 1, processed: 2, failed: 3 }
end
