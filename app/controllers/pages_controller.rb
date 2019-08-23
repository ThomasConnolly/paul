# frozen_string_literal: true

class PagesController < ApplicationController
  def directions; end

  def rector; end

  def trivia; end

  def albergue; end

  def test; end

  def navbarTest; end

  def parish_profile; end

  def long_range; end

  def profileSlides; end

  def jubilee; end

  def history; end

  def ecumenical_concert; end

  def grace_works
    @work = Work.new
    @works = Work.all
  end

  def calendar; end

  def haitian; end

  def survey; end

  def tumaini; end

  def how_to_pray; end

  def python_tutor; end

  def how_to_use; end

  def letsencrypt
    render text: '6CRaNQDPQLLlN_5YaBJ1C00KN-CeT3CcGpEa8Q159T8.t6OHJtTG0T4j8fGWYAHHy6vcUSK_LBe9_JwtCMZ811c'
  end
end
