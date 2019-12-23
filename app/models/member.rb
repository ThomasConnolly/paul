# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  username     :string
#

class Member < ApplicationRecord
  # belongs_to :user
  acts_as_birthday :birthday
  before_save :set_username

  require 'date'

  def self.assign_from_row(row)
    member = Member.where(membership_id: row[:membership_id]).first_or_initialize
    member.assign_attributes row.to_hash.slice(
      :last_name,
      :first_name,
      :membership_id,
      :birthday,
      :email,
      :away_zip
      )
    member
  end

  def set_username
    self.username = "#{first_name} #{last_name}".strip
  end

  def formatted_email
    "#{self.username} <#{self.email}>".strip
  end
end
