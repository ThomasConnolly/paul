class ChangeDataTypeSermonDate < ActiveRecord::Migration
  def change
    remove_column :sermons, :delivered_on, :datetime
    add_column :sermons, :delivered_on, :date
  end
end
