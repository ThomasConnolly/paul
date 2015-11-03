# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :body
  validates_presence_of :user_id
  validates_presence_of :post_id
  acts_as_tree order: 'created_at DESC'
end
