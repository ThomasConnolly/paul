# == Schema Information
#
# Table name: story_ideas
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#

class StoryIdea < ApplicationRecord
  resourcify

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  # has_attachment :story_idea_picture, accept: [:jpg, :png, :gif]
  default_scope -> { order('created_at DESC') }
  validates_presence_of :title
  validates_presence_of :body
end
