require 'csv'

CSV.foreach("member.csv") do |row|
  last_name = row[0]
  first_name = row[1]
  member_id = row[2]
  email = row[3]
  birthday = row[4].prepend "2016/"
end