class DropMeditationsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :meditations
  end
end
