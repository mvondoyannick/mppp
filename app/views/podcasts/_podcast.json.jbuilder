json.extract! podcast, :id, :title, :date_creation, :content, :created_at, :updated_at
json.url podcast_url(podcast, format: :json)
