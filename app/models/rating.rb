class Rating < ApplicationRecord
  belongs_to :characteristic
  belongs_to :user

  #enum score: [ :Choose, :not_important, :somewhat_important, :very_important, :essential ]

end
