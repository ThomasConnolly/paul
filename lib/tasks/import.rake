namespace :import do
  require 'date'

  desc "Import members from csv"
  task members: :environment do
    counter = 0

    CSV.foreach("members.csv", headers: true, header_converters: :symbol) do |row|
      member = Member.where(membership_id: row[:membership_id]).first_or_initialize
      member.assign_attributes row.to_hash.slice( 
        :first_name, 
        :last_name,
        :email,
      ).merge(
         :anniversary  => Date.strptime(row[:anniversary], "%m/%d/%Y").strftime("%d/%m/%Y"),
         :birthday  => Date.strptime(row[:birthday], "%m/%-d").strftime("%d/%m/%Y").unless :birthday = nil
      )
        if member.save
          counter += 1
        else
          puts "#{email} - #{member.errors.full_messages.join(",")}"
        end
      end

      puts "Imported #{counter} members"
    end
  end
