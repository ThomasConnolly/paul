# frozen_string_literal: true

json.extract! meditation, :id, :title, :body, :scripture, :created_at, :updated_at
json.url meditation_url(meditation, format: :json)
