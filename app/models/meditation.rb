class Meditation < ActiveRecord::Base
  validates_presence_of [:name, :title, :scripture, :prayer, :body]
end
