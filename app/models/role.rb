# typed: strict
# frozen_string_literal: true

class Role < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy
end
