# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :characteristic
  belongs_to :user
end
