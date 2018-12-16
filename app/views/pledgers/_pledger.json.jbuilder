json.extract! pledger, :id, :last_name, :salutation, :address1, :address2, :city, :state, :postal_code, :type, :northern_city, :created_at, :updated_at
json.url pledger_url(pledger, format: :json)
