class ChangeColumnTypesInPathways < ActiveRecord::Migration[6.0]
  def change 
    change_column :pathways, :title, 'date USING CAST(title AS date)'
  end
end
