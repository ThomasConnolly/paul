class ChangeEventsTimeToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :time, :time
    add_column :events, :time, :string
  end
end
