json.extract! internal_contact, :id, :name, :email, :role, :phone, :client_id, :created_at, :updated_at
json.url api_v1_internal_contact_url(internal_contact, format: :json)
