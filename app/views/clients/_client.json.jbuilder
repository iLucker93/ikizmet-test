json.extract! client, :id, :client_first_name, :client_last_name, :created_at, :updated_at
json.url client_url(client, format: :json)
