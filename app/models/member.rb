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

  before_save :set_full_name

  def self.assign_from_row(row)
    member = Member.where(membership_id: row["Individual #"]).first_or_initialize
    member.assign_attributes row.to_hash.slice(
      :last_name => row["Last Name"], 
      :first_name => row["First Name"], 
      :email => row["Both"],
      :anniversary =>  row["Marriage Date"], 
      :birthday =>  row["Birth Date"]
      )
      
    member  
    end

    def set_full_name
      self.full_name = "#{self.first_name} #{self.last_name}".strip
    end  
  end
  
