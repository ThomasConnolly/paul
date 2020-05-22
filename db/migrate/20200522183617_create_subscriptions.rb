class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :plan_id
      t.string :user_id
      t.boolean :active, default: true
      t.datetime :current_period_ends
      t.string :stripe_id
      t.string :pledge_id

      t.timestamps
    end
  end
end
