json.extract! order_item, :id, :order_id, :product_id, :quantity, :created_at, :updated_at
json.url api_v1_order_item_url(order_item, format: :json)
