# frozen_string_literal: true

# == Schema Information
#
# Table name: anniversaries
#
#  id          :integer          not null, primary key
#  salutation  :string
#  last_name   :string
#  anniversary :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Anniversary < ApplicationRecord
  acts_as_birthday :anniversary

  def self.assign_from_row(row)
    anniversary = find_by_salutation(row[:salutation]) || new
    anniversary.assign_attributes row.to_hash.slice(
      :salutation,
      :last_name,
      :anniversary
    )
    anniversary
    end
end
