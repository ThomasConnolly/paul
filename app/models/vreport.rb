class Vreport < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: {maximum: 100}
end
