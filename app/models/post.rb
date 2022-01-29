# frozen_string_literal: true

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
  has_rich_text :content
  has_one_attached :picture
  has_many_attached :photos

  default_scope -> { order('created_at DESC') }
end
