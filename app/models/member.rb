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
#  full_name     :string
#

class Member < ActiveRecord::Base

  belongs_to :user
  acts_as_birthday :birthday
  before_save :set_full_name

  

  

def self.assign_from_row(row)
  member = Member.where(membership_id: row[:membership_id]).first_or_initialize
  member.assign_attributes row.to_hash.slice(
  :last_name, :first_name, :email
  ).merge(
    :birthday => DateTime.strptime(row[4],"%m/%d/%Y").strftime("%Y/%m/%d")
)
  member
end


  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end   
end
