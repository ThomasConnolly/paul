class HomeController < ApplicationController

  def index
    @works = Work.all
    @work = Work.new
  end

  def invitation
  end
end
