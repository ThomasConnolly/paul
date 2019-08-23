# frozen_string_literal: true

# == Schema Information
#
# Table name: letters
#
#  id         :bigint(8)        not null, primary key
#  salutation :string
#  last_name  :string
#  address1   :string
#  address2   :string
#  city       :string
#  state      :string
#  zipcode    :string
#  writer     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Letter < ApplicationRecord
  validates_presence_of :last_name

  # Export range of letters to csv file for mailMerge printing
  def self.to_csv
    attributes = %w[salutation last_name address1 address2 city state zipcode]
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |address|
        csv << address.attributes.values_at(*attributes)
      end
    end
  end

  # Importing letters from csv file
  def self.assign_from_row(row)
    letter = Letter.where(last_name: row[:last_name]).first_or_initialize
    letter.assign_attributes row.to_hash.slice(
      :salutation, :last_name, :address1, :address2, :city, :state, :zip_code, :writer
    )
    letter
  end
end
