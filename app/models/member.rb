# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  membership_id :string
#  email      :string
#  birthday   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base

  belongs_to :user
  acts_as_birthday :birthday
  before_save :set_full_name
  # after_create :send_email
  

  

def self.assign_from_row(row)
  member = Member.where(membership_id: row[:membership_id]).first_or_initialize
  member.assign_attributes row.to_hash.slice(
  :last_name, :first_name, :email)
  #  ) .merge.unless.nil?(
  #  :birthday => DateTime.strptime(row[4],"%m/%d/%Y").strftime("%Y/%m/%d")
  # )
  member
end


  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end 


  #def send_email
  #  MemberMailer.member_survey(@member).deliver_later
  #end    
end
