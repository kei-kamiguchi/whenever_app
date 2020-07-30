json.extract! movie, :id, :title, :content, :status, :publish_at, :created_at, :updated_at
json.url movie_url(movie, format: :json)
