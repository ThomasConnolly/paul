# frozen_string_literal: true

json.array! @search_tasks, partial: 'search_tasks/search_task', as: :search_task
