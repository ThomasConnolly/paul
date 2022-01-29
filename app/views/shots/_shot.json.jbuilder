# frozen_string_literal: true

json.extract! shot, :id, :last_name, :first_name, :dob, :email, :phone, :shot_time, :status, :honey, :created_at,
              :updated_at
json.url shot_url(shot, format: :json)
