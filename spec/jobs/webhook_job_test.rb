# frozen_string_literal: true

require 'test_helper'

class WebhookJobTest < ActiveJob::TestCase
  setup do
    @webhook = Webhook.create!(
      event_id: 'evt_test',
      data: {
        'data' => {
          'object' => {
            'customer_details' => { 'name' => 'Test Donor' },
            'amount' => 5000
          }
        }
      }.to_json,
      status: :pending
    )
  end

  test 'perform creates a StripeReport and updates webhook status to processed' do
    assert_difference 'StripeReport.count', 1 do
      WebhookJob.perform_now(@webhook.id, 'payment_intent.succeeded', @webhook.data, 'Test Donor')
    end

    @webhook.reload
    assert_equal 'processed', @webhook.status
  end

  test 'perform handles missing donor name and sets status to processed' do
    @webhook.update!(data: { 'data' => { 'object' => { 'amount' => 5000 } } }.to_json)

    assert_difference 'StripeReport.count', 1 do
      WebhookJob.perform_now(@webhook.id, 'payment_intent.succeeded', @webhook.data, nil)
    end

    @webhook.reload
    assert_equal 'processed', @webhook.status
    assert_equal 'Anonymous Donor', StripeReport.last.donor_name
  end

  test 'perform handles errors and sets status to failed' do
    Webhook.any_instance.stubs(:update!).raises(StandardError, 'Test error')

    assert_no_difference 'StripeReport.count' do
      WebhookJob.perform_now(@webhook.id, 'payment_intent.succeeded', @webhook.data, 'Test Donor')
    end

    @webhook.reload
    assert_equal 'failed', @webhook.status
  end

  private

  def some_private_method
    # code here
  end
end
