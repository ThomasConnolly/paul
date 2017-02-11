class HomeController < ApplicationController
  def index
   @meditations = Meditation. all
  end



  def invitation
  end
end
