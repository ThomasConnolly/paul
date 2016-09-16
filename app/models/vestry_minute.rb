# == Schema Information
#
# Table name: vestry_minutes
#
#  id         :integer          not null, primary key
#  date       :date
#  minutes    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VestryMinute < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
end
