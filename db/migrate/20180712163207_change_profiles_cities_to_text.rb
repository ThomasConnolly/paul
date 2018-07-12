class ChangeProfilesCitiesToText < ActiveRecord::Migration[5.2]
  def change
    change_table :profiles do |t|
      t.change :cities, :text
  end
end
end
