class AddDefaultPlanToAlbergueDonations < ActiveRecord::Migration[5.2]
  def change
    change_column :albergue_donations, :plan, :string, default: "plan_EU0tm2nqfqXFYj"
  end
end
