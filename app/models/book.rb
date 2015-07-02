# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  title      :string(255)
#  subject    :string(255)
#  isbn       :string(255)
#  dewey      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title
end