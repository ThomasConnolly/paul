class HomeController < ApplicationController
  def index
   @meditations = Meditation.all
   @meditation = Meditation.publish_on_today.first
   @prayers = Prayer.all
  end

  def invitation
  end
end
