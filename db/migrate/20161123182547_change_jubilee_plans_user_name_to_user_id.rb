class ChangeJubileePlansUserNameToUserId < ActiveRecord::Migration
  def change
    remove_column :jubilee_plans, :user_name, :string
    add_column :jubilee_plans, :user_id, :integer
  end
end
