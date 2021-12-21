json.extract! product, :id, :name, :ref_code, :description, :product_category_id, :created_at, :updated_at
json.url api_v1_product_url(product, format: :json)
