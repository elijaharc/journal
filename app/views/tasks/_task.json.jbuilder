json.extract! task, :id, :item, :description, :created_at, :updated_at
json.url task_url(task, format: :json)
