class AddStartAndStopDateToPledges < ActiveRecord::Migration[5.2]
  def change
    add_column :pledges, :start_date, :date
    add_column :pledges, :end_date, :date
  end
end
