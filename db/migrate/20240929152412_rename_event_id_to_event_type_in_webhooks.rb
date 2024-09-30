# frozen_string_literal: true

class RenameEventIdToEventTypeInWebhooks < ActiveRecord::Migration[7.2]
  def change
    rename_column :webhooks, :event_id, :event_type
  end
end
