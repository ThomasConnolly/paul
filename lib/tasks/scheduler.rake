desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  EnsFeed.update_from_feed('https://www.episcopalnewsservice.org/feed/?cat=-6%2C-8')
  puts "done."
end

task :send_reminders => :environment do
  User.send_reminders
end
