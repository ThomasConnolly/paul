# typed: true
# frozen_string_literal: true

class HomeController < ApplicationController
  def index

    begin
      @ens_feed = fetch_ens_feed # Your existing method
      # Rest of your code
    rescue => e
      Rails.logger.error "Error fetching ENS feed: #{e.message}"
      @ens_feed = [] # Provide an empty array instead of nil
    end
    
    def set_common_links
      @worship = Link.find_by(event: 'worship')
      @bulletin = Link.find_by(event: 'bulletin')
      @wine = Link.find_by(event: 'wine_time')
      @vestry_meeting = Link.find_by(event: 'vestry_meeting')
    end
  end

  def show
    @worship = Link.find_by(event: 'worship')
    @bulletin = Link.find_by(event: 'bulletin')
    @wine = Link.find_by(event: 'wine_time')
    @vestry_meeting = Link.find_by(event: 'vestry_meeting')
  end
end
