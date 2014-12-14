class AddFullNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :full_name, :string
    execute <<-SQL
      UPDATE users SET full_name = first_name||' '||last_name WHERE full_name IS NULL;
    SQL
  end
end
