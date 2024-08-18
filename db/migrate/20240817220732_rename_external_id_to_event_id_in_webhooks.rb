class RenameExternalIdToEventIdInWebhooks < ActiveRecord::Migration[7.2]
  def change
    rename_column :webhooks, :external_id, :event_id
  end
end
