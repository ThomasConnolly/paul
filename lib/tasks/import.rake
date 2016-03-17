namespace :import do 

  desc "Import members from csv"
  task members: :environment do
    import = Member::Import.new file: File.open("membership.csv")
    import.process!
    puts "Imported #{import.imported_count} members"
    puts import.errors.full_messages
    
  end
end