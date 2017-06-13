# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string(255)
#  title      :string(255)
#  subject    :string(255)
#  isbn       :string(255)
#  dewey      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :author

  after_find :set_cutter

  # Export range of books to csv file for label printing
  def self.to_csv
    attributes = %w{id dewey cutter}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |book|
        csv << book.attributes.values_at(*attributes)
      end
    end
  end

  #Importing books from csv file
  def self.assign_from_row(row)
    book = Book.where(isbn: row[:isbn]).first_or_initialize
    book.assign_attributes row.to_hash.slice(
    :title, :author, :dewey, :isbn, :subject, :description)
    book
  end


private

    def set_cutter
      self.cutter = "#{self.author[0,3]}" if self.author?
  end
end
