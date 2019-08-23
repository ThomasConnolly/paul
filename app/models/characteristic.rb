# frozen_string_literal: true

class Characteristic < ApplicationRecord
  belongs_to :user
  validates_presence_of :name
end
