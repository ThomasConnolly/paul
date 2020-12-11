class EnsFeed < ApplicationRecord

feed_url = "https://www.episcopalnewsservice.org/feed/?cat=-6%2C-8"

  def self.update_from_feed(feed_url)
    xml = HTTParty.get(feed_url).body
    feed = Feedjira.parse(xml)
    feed.entries.each do |entry|
      unless exists? guid: entry.id
      create!(
        title: entry.title,
        summary: entry.summary,
        url: entry.url,
        published_at: entry.published,
        guid: entry.id
      )
      end    
    end
  end
end
