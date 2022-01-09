# == Schema Information
#
# Table name: webhook_events
#
#  id                :integer          not null, primary key
#  source            :string
#  external_id       :string
#  data              :json
#  state             :integer          default("0")
#  processing_errors :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_webhook_events_on_external_id             (external_id)
#  index_webhook_events_on_source                  (source)
#  index_webhook_events_on_source_and_external_id  (source,external_id)
#

require 'rails_helper'

RSpec.describe WebhookEvent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
