json.extract! product_category, :id, :name, :ref_code, :description, :created_at, :updated_at
json.url product_category_url(product_category, format: :json)
