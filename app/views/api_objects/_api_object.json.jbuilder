json.extract! api_object, :id, :key, :value, :created_at, :updated_at
json.url api_object_url(api_object, format: :json)