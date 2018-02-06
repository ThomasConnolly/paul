json.extract! search_task, :id, :title, :body, :url, :user_id, :created_at, :updated_at
json.url search_task_url(search_task, format: :json)
