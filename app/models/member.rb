class Member < ActiveRecord::Base

  def self.assign_from_row(row)
    member = Member.where(membership_id: row[:member_id]).first_or_initialize
    member.assign_attributes row.to_hash.slice(
      :membership_id, 
      :last_name, 
      :first_name, 
      :email
      :anniversary
      :birthday
      #  ).merge ( 
      #  :anniversary => DateTime.strptime(row[:anniversary], "%m/%d/%Y").strftime("%Y/%m/%d"),
      #  :birthday => DateTime.strptime(row[:birthday], "%m/%d/%Y").strftime("%Y/%m/%d")
      )
    member  
    end
  end
  