class AddAudioToSermon < ActiveRecord::Migration[5.1]
  def change
    add_column :sermons, :audio, :string
  end
end
