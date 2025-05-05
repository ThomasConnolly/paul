# frozen_string_literal: true

# db/migrate/20250428173111_ensure_page_content_body_is_text.rb
class EnsurePageContentBodyIsText < ActiveRecord::Migration[7.0]
  def change
    # Check if the body column exists
    if column_exists?(:page_contents, :body)
      # Change the column type to :text if it exists but is not a text type
      column_type = connection.columns(:page_contents).find { |c| c.name == 'body' }.type
      change_column :page_contents, :body, :text unless column_type == :text
    else
      # Add the body column if it doesn't exist
      add_column :page_contents, :body, :text
    end
  end
end
