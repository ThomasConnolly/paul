class ChangeNamePatternOnTickets < ActiveRecord::Migration[8.0]
  def change
    remove_column :tickets, :first_name, :string
    remove_column :tickets, :last_name, :string
    add_column :tickets, :name, :string
  end
end
