json.extract! contact_event, :id, :contact_type, :internal_contact_id, :client_id,
                             :representative_id, :occurred_at, :created_at, :updated_at
json.url api_v1_contact_event_url(contact_event, format: :json)
