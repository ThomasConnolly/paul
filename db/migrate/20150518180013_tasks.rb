class Tasks < ActiveRecord::Migration
  def change
    create_table "tasks", force: true do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "title", null: false
      t.text "description"
      t.string "deadline", null: false
  end
end

end
