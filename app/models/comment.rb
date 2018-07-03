# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  created_at       :datetime
#  updated_at       :datetime
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string
#

class Comment < ApplicationRecord
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates_presence_of :body
end
