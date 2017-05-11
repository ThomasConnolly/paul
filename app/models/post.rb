# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates_presence_of :content
  validates_presence_of :user_id
  mount_uploader :picture, PictureUploader

  default_scope -> { order('created_at DESC') }

end
