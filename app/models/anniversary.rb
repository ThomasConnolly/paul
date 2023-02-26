# frozen_string_literal: true

# == Schema Information
#
# Table name: anniversaries
#
#  id          :integer          not null, primary key
#  salutation  :string
#  last_name   :string
#  marriage :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Anniversary < ApplicationRecord
  acts_as_birthday :marriage
  
  # around_update :set_yday
  # def set_yday
  #   self.yday = marriage.yday unless marriage.nil?
  # end

  def self.assign_from_row(row)
    anniversary = find_by_salutation(row[:salutation]) || new
    anniversary.assign_attributes row.to_hash.slice(
      :salutation,
      :last_name,
      :marriage
    )
    anniversary
  end
end


