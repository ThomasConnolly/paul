# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  author     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :author, :body
end
