# == Schema Information
#
# Table name: ens_feeds
#
#  id           :bigint           not null, primary key
#  link         :text
#  published_at :datetime
#  summary      :text
#  title        :string
#  url          :string
#  uuid         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class EnsFeed < ApplicationRecord
    def self.update_from_feed(feed_url)
      feed = Feedjira::Feed.parse(feed_url)
      feed.entries.each do |entry|
        unless exists? uuid: entry.id 
          create!(
            name: entry.title,
            summary: entry.summary,
            url: entry.url,
            published_at: entry.published,
            uuid: entry.id
        )
    end
  end
end
end
