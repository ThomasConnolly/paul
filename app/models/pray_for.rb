class PrayFor < ApplicationRecord
  # honey used to prevent bots-filled forms from being saved to db
  validates :honey, absence: true
end
