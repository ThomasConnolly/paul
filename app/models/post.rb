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
  
  validates_presence_of :content
  has_attachment :post_picture, accept: [:jpg, :png, :gif]
  has_attachments :photos, accept: [:jpg, :png, :gif] 
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  
end
