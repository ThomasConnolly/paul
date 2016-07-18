class CreateParishSurveys < ActiveRecord::Migration
  def change
    create_table :parish_surveys do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
