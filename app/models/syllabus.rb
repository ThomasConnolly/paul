class Syllabus < ActiveRecord::Base
	validates_presence_of :year
	validates_presence_of :grade
	validates_presence_of :quarter
	validates_presence_of :title9
end
