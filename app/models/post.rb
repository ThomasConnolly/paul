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
  has_attachment :photo, accept: [:jpg, :jpeg, :png, :gif]
  validates_presence_of :content
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  
end

