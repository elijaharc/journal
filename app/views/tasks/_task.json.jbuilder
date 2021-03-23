json.extract! task, :id, :item, :description, :category, :created_at, :updated_at
json.url task_url(task, format: :json)
