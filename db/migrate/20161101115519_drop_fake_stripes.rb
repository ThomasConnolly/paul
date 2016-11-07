class DropFakeStripes < ActiveRecord::Migration
  def change
    drop_table :fake_stripes
  end
end
