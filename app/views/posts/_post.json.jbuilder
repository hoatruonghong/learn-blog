json.extract! post, :id, :author, :content, :likes, :created_at, :updated_at
json.url post_url(post, format: :json)
