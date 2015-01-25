# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  picture    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ActiveRecord::Base
  attachment :picture
  validates_presence_of :content
  has_many :comments, dependent: :destroy
  default_scope -> { order('created_at DESC') }
  belongs_to :user
  
end

