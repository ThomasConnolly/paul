# == Schema Information
#
# Table name: members
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  email         :string
#  anniversary   :date
#  birthday      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  membership_id :string
#  full_name     :string
#

class Member < ActiveRecord::Base

  belongs_to :user
  before_save :set_full_name
  acts_as_birthday :birthday
  before_save :prepend_year

def self.assign_from_row(row)
  member = Member.where(membership_id: row[:membership_id]).first_or_initialize
  member.assign_attributes row.to_hash(
  :last_name => row['Last Name'], 
  :first_name => row['Preferred Name'],
  :membership_id => row['Individual #'],
  :email => row['E-mail'],
  :birthday => row['Birth Date']
  )
  member
end


  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end 

  def prepend_year
    self.birthday.prepend "2016/"
  end     
end
