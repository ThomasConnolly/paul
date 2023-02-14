class Story < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_rich_text :body
end
