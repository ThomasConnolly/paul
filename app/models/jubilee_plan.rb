# == Schema Information
#
# Table name: jubilee_plans
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class JubileePlan < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates_presence_of [ :title, :body, :user_id ]
end
