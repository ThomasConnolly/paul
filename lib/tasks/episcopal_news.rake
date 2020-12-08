namespace :episcopal_news do
  task :update do
    EnsFeed.update_from_feed('https://www.episcopalnewsservice.org/feed/?cat=-6%2C-8')
  end
end
