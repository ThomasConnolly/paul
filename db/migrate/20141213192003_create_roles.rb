class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.boolean :admin
      t.boolean :editor
      t.boolean :member, :default => true

      t.timestamps
    end
  end
end
