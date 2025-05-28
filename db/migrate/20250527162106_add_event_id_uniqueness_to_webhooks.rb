class AddEventIdUniquenessToWebhooks < ActiveRecord::Migration[8.0]
  def change
    add_index :webhooks, :event_id, unique: true, name: 'index_webhooks_on_event_id'
    # This migration ensures that each webhook event_id is unique.
  end
end
