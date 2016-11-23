class AddJubileeToUser < ActiveRecord::Migration
  def change
    add_column :users, :jubilee, :boolean, default: false
  end
end
