class Anniversary < ActiveRecord::Base

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
