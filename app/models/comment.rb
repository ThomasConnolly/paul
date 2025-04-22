# typed: true
# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  commentable_type :string           not null
#  commentable_id   :bigint           not null
#  parent_id        :integer
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: 'Comment'
  
  # Renamed association to avoid conflict with method
  has_many :child_comments, class_name: 'Comment', as: :commentable, dependent: :destroy
  
  validates :body, presence: true

  # Keep your custom method 
  def comments
    Comment.where(commentable: self, parent_id: id)
  end
end