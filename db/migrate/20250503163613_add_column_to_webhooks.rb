# frozen_string_literal: true

class AddColumnToWebhooks < ActiveRecord::Migration[8.0]
  def change
    add_column :webhooks, :event_id, :string
  end
end
