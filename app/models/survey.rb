# == Schema Information
#
# Table name: surveys
#
#  id             :bigint           not null, primary key
#  a1             :text
#  a2             :text
#  a3             :text
#  added_comments :text
#  q1             :string
#  q2             :string
#  q3             :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Survey < ApplicationRecord
  belongs_to :user
end
