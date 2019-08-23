# frozen_string_literal: true

class Member::Import
  include ActiveModel::Model
  attr_accessor :file, :imported_count

  def process!
    filename = File.join Rails.root, "member.csv"
    @imported_count = 0
    CSV.foreach(filename, headers: true, header_converters: %i[symbol date]) do |row|
      member = Member.assign_from_row(row)
      if member.save
        @imported_count += 1

      else
        errors.add :base, "Line #{$INPUT_LINE_NUMBER} - #{member.errors
        .full_messages.join(',')}"
      end
    end
  end

  def save
    process!
    errors.none?
  end
end
