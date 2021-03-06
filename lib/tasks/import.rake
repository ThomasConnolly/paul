# frozen_string_literal: true
# see desktop file "creds.txt" to fix csv dates in calc before importing
namespace :import do
  
  desc 'Import members from csv'
  task members: :environment do
    import = Member::Import.new file: File.open('members.csv')
    import.process!
    puts "Imported #{import.imported_count} members"
    puts import.errors.full_messages
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