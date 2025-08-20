json.extract! quest, :id, :title, :is_complete, :created_at, :updated_at
json.url quest_url(quest, format: :json)
