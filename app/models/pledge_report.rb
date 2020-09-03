class PledgeReport < ApplicationRecord
  belongs_to :pledge
  belongs_to :user
end
