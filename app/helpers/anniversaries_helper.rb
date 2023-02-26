# frozen_string_literal: true

module AnniversariesHelper
 
  def recent_anniversaries
    Anniversary.find_marriages_for(Date.today-7, Date.today+7).order(:marriage)
  end
end
