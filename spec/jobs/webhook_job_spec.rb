# frozen_string_literal: true

# spec/jobs/webhook_job_spec.rb

require 'rails_helper'

RSpec.describe WebhookJob, type: :job do
  include FactoryBot::Syntax::Methods

  let(:webhook_data) { { data: { object: { customer_details: { name: 'John Doe' }, amount: 1000 } } }.to_json }
  let(:webhook) { create(:webhook, data: webhook_data, event_id: 'evt_123456789') }
  let(:donor_name) { 'John Doe' }

  describe '#perform' do
    it 'creates a StripeReport and updates webhook status to processed' do
      expect do
        WebhookJob.perform_now(webhook.id, donor_name)
      end.to change(StripeReport, :count).by(1)

      webhook.reload
      expect(webhook.status).to eq('processed')
    end
  end
end
