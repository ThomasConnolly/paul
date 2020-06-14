# frozen_string_literal: true

class HomeController < ApplicationController

  def index
    @worship = Link.find_by(event: "worship")
    @bulletin = Link.find_by(event: "bulletin")
    @wine = Link.find_by(event: "wine_time")
    @coffee = Link.find_by(event: "coffee")
    @day_bible = Link.find_by(event: "day_bible")
    @evening_bible = Link.find_by(event: "evening_bible")
    @pathway = Pathway.order("created_at ASC").last
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
