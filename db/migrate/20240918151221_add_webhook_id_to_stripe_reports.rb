# frozen_string_literal: true

class AddWebhookIdToStripeReports < ActiveRecord::Migration[6.1]
  def change
    add_column :stripe_reports, :webhook_id, :integer
    add_index :stripe_reports, :webhook_id
  end
end
