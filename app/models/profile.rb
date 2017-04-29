# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cities     :string(255)
#  background :text
#  career     :text
#  family     :text
#  lifestyle  :text
#  civic      :text
#  church     :text
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ApplicationRecord
  belongs_to :user
end
