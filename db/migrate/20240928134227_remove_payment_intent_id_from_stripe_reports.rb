# frozen_string_literal: true

class RemovePaymentIntentIdFromStripeReports < ActiveRecord::Migration[7.2]
  def change
    remove_column :stripe_reports, :payment_intent_id, :string
  end
end
