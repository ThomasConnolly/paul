# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  away_zip      :string
#  birthday      :date
#  email         :string
#  first_name    :string
#  last_name     :string
#  username      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#

class Member < ApplicationRecord
  # belongs_to :user
  acts_as_birthday :birthday
  before_save :set_username

  require 'date'
  
  #Importing members from csv file
  def self.assign_from_row(row)
    member = Member.where(membership_id: row[:membership_id]).first_or_initialize
    member.assign_attributes row.to_hash.slice(
      :last_name,
      :first_name,
      :membership_id,
      :email,
      :away_zip
    ).merge(
      :birthday => DateTime.strptime(row[3], "%m/%d/%Y").strftime("%Y-%m-%d")
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
