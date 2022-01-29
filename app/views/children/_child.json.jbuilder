# frozen_string_literal: true

json.extract! child, :id, :first_name, :last_name, :birthday, :created_at, :updated_at
json.url child_url(child, format: :json)
