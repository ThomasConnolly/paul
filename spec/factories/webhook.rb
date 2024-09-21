# frozen_string_literal: true

# spec/factories/webhooks.rb

FactoryBot.define do
  factory :webhook do
    event_id { 'evt_123456789' }
    data { { data: { object: { customer_details: { name: 'John Doe' }, amount: 1000 } } }.to_json }
    status { 'pending' }
  end
end
