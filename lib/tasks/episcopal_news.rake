namespace :episcopal_news do
  desc "Update home page news reader, the ENS rss"
  task updater: :environment do
    EnsFeed.update_from_feed('https://www.episcopalnewsservice.org/feed/?cat=-6%2C-8')
  end
end
