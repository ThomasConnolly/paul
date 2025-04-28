# frozen_string_literal: true

class PageContent < ApplicationRecord
  validates :section, presence: true
end
