class SearchTask < ApplicationRecord
  resourcify

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_attachment :search_task_picture, accept: [:jpg, :png, :gif]
  default_scope -> { order('created_at DESC') }
  validates_presence_of :title
  validates_presence_of :body
end
