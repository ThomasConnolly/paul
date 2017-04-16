class HomeController < ApplicationController
  def index
   @meditations = Meditation.all
   @meditation = Meditation.find(34)
   @prayers = Prayer.all
  end

  def invitation
  end
end
