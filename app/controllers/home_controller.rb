# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    @ens_feed = EnsFeed.all.order('published_at DESC').limit(6)
    @christmas_eve = Link.find_by(event: "christmas_eve")
    @christmas_day = Link.find_by(event: "christmas_day")
    @worship = Link.find_by(event: "worship")
    @bulletin = Link.find_by(event: "bulletin")
    @wine = Link.find_by(event: "wine_time")
    @coffee = Link.find_by(event: "coffee")
    @tgiving_coffee = Link.find_by(event: "tgiving_coffee")
    @day_bible = Link.find_by(event: "day_bible")
    @evening_bible = Link.find_by(event: "evening_bible")
    @thanksgiving = Link.find_by(event: "thanksgiving")
    @thanksgiving_bulletin = Link.find_by(event: "thanksgiving_bulletin")
    @pathway = Pathway.order("created_at ASC").last
    @birthdays_today = Member.where('EXTRACT(month FROM birthday) = ? AND EXTRACT(day FROM birthday) = ?', Date.today.strftime('%m'), Date.today.strftime('%d'))
  end

  def show
    @worship = Link.find_by(event: "worship")
    @bulletin = Link.find_by(event: "bulletin")
    @wine = Link.find_by(event: "wine_time")
    @coffee = Link.find_by(event: "coffee")
    @day_bible = Link.find_by(event: "day_bible")
    @evening_bible = Link.find_by(event: "evening_bible")
    @pathway = Pathway.order("created_at ASC").last
  end
end
