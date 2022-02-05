# frozen_string_literal: true

class ProcessEventsJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = WebhookEvent.find(event_id)
    if event.pending? || event.failed?
      event.update(state: :processing)
      begin
          Events::StripeHandler.process(event)
      end
        event.update(state: :processed)
    end
      rescue StandardError => e
        event.update(state: :failed, processing_errors: e)
    end
end
