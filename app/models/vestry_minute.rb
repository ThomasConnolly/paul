# frozen_string_literal: true

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

class VestryMinute < ApplicationRecord
  has_rich_text :body
  default_scope -> { order('created_at DESC') }
  validates_presence_of :date
end
