# typed: false
# frozen_string_literal: true

class HandleWebhooksJob < ApplicationJob
  queue_as :default

  def perform(webhook)
    data = JSON.parse(webhook.data, symbolize_names: true)
    event = Stripe::Event.construct_from(data)

    case event.type

    when 'payment_intent.succeeded'
      # Find pledge and update status
      webhook.update!(status: :processed)
    when 'payment_intent.payment_failed'
      webhook.update!(status: :failed)
    end
  end
end
