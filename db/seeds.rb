
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, 
#  { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['admin', 'editor', 'member', 'visitor'].each do |role|
  Role.find_or_create_by({name: role})
endAdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')