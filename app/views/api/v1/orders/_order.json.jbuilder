json.extract! order, :id, :contact_event_id, :order_type, :status, :created_at, :updated_at
json.url api_v1_order_url(order, format: :json)
