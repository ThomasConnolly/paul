# frozen_string_literal: true

namespace :import do
  desc 'Import members from csv'
  task members: :environment do
    filename = File.join Rails.root, "member.csv"
    counter = 0
    
    CSV.foreach(filename, headers: true, header_converters: symbol) do |row|
      member = Member.where(membership_id; row[:membership_id]).first_or_initialize
      member.assign_attributes row_to_hash.slice(:first_name, :last_name, 
        :membership_id, :birthday, :email, :away_zip)
      if member.save       
        counter += 1
      else
        puts "#{:membership_id} - #{member.errors.full_messages.join(",")}"
      end
    end

    puts "Imported #{counter} members"
    end
  end

  desc 'Import users from csv'
  task users: :environment do
    import = User::Import.new file: File.open('users.csv')
    import.process!
    puts "Imported #{import.imported_count} users"
    puts import.errors.full_messages
  end

  desc 'Import letters from csv'
  task letters: :environment do
    import = Letter::Import.new file: File.open('letters.csv')
    import.process!
    puts "Imported #{import.imported_count} letters"
    puts import.errors.full_messages
  end

  desc 'Import anniversaries from csv'
  task anniversaries: :environment do
    import = Anniversary::Import.new file: File.open('anniversary.csv')
    import.process!
    puts "Imported #{import.imported_count} anniversaries"
    puts import.errors.full_messages
  end

  desc 'Import books from csv'
  task books: :environment do
    import = Book::Import.new file File.open('books.csv')
    import.process!
    puts "Imported #{import.imported_count} books"
    puts import.errors.full_messages
  end
end
