class HomeController < ApplicationController

  def index
    @works = Work.all
    @work = Work.new
    @drop5_total = Drop5.all
    @drop5 = Drop5.new
  end

  def invitation
  end
end
