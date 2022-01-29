# frozen_string_literal: true

class CreateEnsFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :ens_feeds do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid

      t.timestamps
    end
  end
end
