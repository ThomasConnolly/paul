# frozen_string_literal: true

module MeditationsHelper
  def meditation_today
    Meditation.find_meditation_for(Date.today, Date.today).order(:publish_on).first
  end
end
