json.extract! comment, :id, :content, :user_id, :micropost_id, :rate, :created_at, :updated_at
json.url comment_url(comment, format: :json)
