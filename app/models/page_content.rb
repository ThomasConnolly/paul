# frozen_string_literal: true

class PageContent < ApplicationRecord
  has_rich_text :body
end
