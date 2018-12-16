json.extract! donation, :id, :type, :amount, :pay_this, :user_id, :anonymous, :created_at, :updated_at
json.url donation_url(donation, format: :json)
