# frozen_string_literal: true

module AnniversariesHelper
 
  def anniversaries_this_month
    Anniversary.find_anniversaries_for(Date.today.beginning_of_month,
                                       Date.today.end_of_month).order(:anniversary)
  end
end
