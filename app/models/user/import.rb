class User::Import
  include ActiveModel::Model
  attr_accessor :file, :imported_count

CSV::Converters[:blank_to_nil] = lambda do |field|
  field && field.empty? ? nil : field
end

  def process!
    @imported_count = 0
    CSV.foreach(file.path, headers: true, header_converters: :symbol, 
      converters: [:date, :blank_to_nil] ) do |row|
      user = User.assign_from_row(row)
      if user.save
        @imported_count += 1
      else
        errors.add :base, "Line #{$.} - #{user.errors.
        full_messages.join(",")}"
      end
    end
  end

  def save
    process!
    errors.none?
  end
end
