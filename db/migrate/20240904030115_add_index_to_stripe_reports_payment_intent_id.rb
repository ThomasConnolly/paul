# frozen_string_literal: true

class AddIndexToStripeReportsPaymentIntentId < ActiveRecord::Migration[7.2]
  def change
    add_index :stripe_reports, :payment_intent_id, unique: true
  end
end
