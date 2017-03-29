class Prayer < ActiveRecord::Base
  validates_presence_of [:day_of_prayer, :time_of_prayer] 

end
