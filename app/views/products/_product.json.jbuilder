json.extract! product, :id, :title, :description, :base_price, :expiry_time, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
