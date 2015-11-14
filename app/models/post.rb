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

class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates_presence_of :content
  validates_presence_of :user_id
  has_attachment :post_picture, accept: [:jpg, :png, :gif]
  has_attachments :photos, accept: [:jpg, :png, :gif] 
  default_scope -> { order('created_at DESC') }

end
