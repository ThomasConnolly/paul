class ChangeRatingScoreToString < ActiveRecord::Migration[5.1]
  def change
    change_table :ratings do |t|
      t.change :score, :string
  end
end
end
