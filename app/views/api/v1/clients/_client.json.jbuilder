json.extract! client, :id, :company_name, :production_capacity, :pay_for_shipping,
                      :payment_condition, :representative_id, :created_at, :updated_at
json.url api_v1_client_url(client, format: :json)
json.internal_contacts_url api_v1_client_internal_contacts_url(client)
