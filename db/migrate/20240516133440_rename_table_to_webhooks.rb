# frozen_string_literal: true

class RenameTableToWebhooks < ActiveRecord::Migration[7.1]
  def change
    rename_table :webhook_events, :webhooks
  end
end
