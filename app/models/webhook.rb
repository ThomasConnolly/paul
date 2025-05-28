# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: webhooks
#
#  id             :bigint           not null, primary key
#  data           :json
#  status :enum             default("pending")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_type     :string
#  date           :datetime
#

class Webhook < ApplicationRecord
  enum :status, { pending: 0, processed: 1, failed: 2 }
end
