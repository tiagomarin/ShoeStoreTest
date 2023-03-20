json.extract! promo_code, :id, :title, :value, :applicable_to, :created_at, :updated_at
json.url promo_code_url(promo_code, format: :json)
