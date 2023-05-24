json.extract! customer, :id, :fullName, :phone, :gender, :description, :created_at, :updated_at
json.url customer_url(customer, format: :json)
