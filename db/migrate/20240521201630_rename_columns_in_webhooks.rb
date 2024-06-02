# frozen_string_literal: true

class RenameColumnsInWebhooks < ActiveRecord::Migration[7.1]
  def change
    rename_column :webhooks, :state, :status
    remove_column :webhooks, :source, :string
    remove_column :webhooks, :processing_errors, :text
  end
end
