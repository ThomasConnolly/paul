# frozen_string_literal: true

require 'English'
module Member
  class Import
    include ActiveModel::Model
    attr_accessor :file, :imported_count

    def process!
      @imported_count = 0
      CSV.foreach(file.path, headers: true, header_converters: %i[symbol date]) do |row|
        member = Member.assign_from_row(row)
        if member.save
          @imported_count += 1
        else
          errors.add :base, "Line #{$INPUT_LINE_NUMBER} -
        #{member.errors.full_messages.join(',')}"
        end
      end
    end

    def save
      process!
      errors.none?
    end
  end
end

# CSV.foreach(file, col_sep: ';', headers: true) do |row|
#   data = row.to_h.transform_keys(&:strip)
#   birthday = Date.parse("2020-#{data['month']}-#{data['day']}")
# end
