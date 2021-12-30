json.extract! user, :id, :name, :email, :created_at, :updated_at
json.url api_v1_user_url(user, format: :json)
json.clients_url api_v1_user_clients_url(user)
