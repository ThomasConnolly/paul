# typed: true
# frozen_string_literal: true

# typed: true

class HomeController < ApplicationController
  before_action :set_common_links, only: %i[index show]

  def index
    # Fetch ENS feed with error handling
    begin
      @ens_feed = EnsFeed.order(published_at: :desc).limit(5)
    rescue StandardError => e
      Rails.logger.error "Error fetching ENS feed: #{e.message}"
      @ens_feed = [] # Provide an empty array instead of nil
    end

    # Fetch page content
    @celebrate_content = PageContent.find_by(section: 'celebrate')
    @reflect_content = PageContent.find_by(section: 'reflect')
    @market_content = PageContent.find_by(section: 'market')
  end

  def show; end

  private

  def set_common_links
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
    @vestry_meeting = Link.find_by(event: 'vestry_meeting')
  end
end
