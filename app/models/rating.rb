class Rating < ApplicationRecord
  belongs_to :characteristic
  belongs_to :user
end
