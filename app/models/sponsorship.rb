class Sponsorship < ApplicationRecord
	belongs_to :user
	validates :amount, :presence => true, :numericality => {:greater_than => 0}
	validates_presence_of :user_id

end
