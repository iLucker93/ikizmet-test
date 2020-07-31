json.extract! client_sale, :id, :client_first_name, :client_last_name, :client_id, :created_at, :updated_at
json.url client_sale_url(client_sale, format: :json)
