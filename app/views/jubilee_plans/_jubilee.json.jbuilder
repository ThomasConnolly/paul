# frozen_string_literal: true

json.extract! jubilee_plan, :id, :title, :body, :user_id, :created_at, :updated_at
json.url jubilee_url(jubilee_plan, format: :json)
