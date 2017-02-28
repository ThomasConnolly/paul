class HomeController < ApplicationController
  def index
   @meditations = Meditation.all
   @meditation = Meditation.publish_on_today.first
  end

  def invitation
  end
end
