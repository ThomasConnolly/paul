class DropJubileePlansTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :jubilee_plans
  end
end
