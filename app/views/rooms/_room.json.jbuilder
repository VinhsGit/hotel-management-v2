json.extract! room, :id, :bedNum, :description, :isAvailable, :checkOutDate, :created_at, :updated_at
json.url room_url(room, format: :json)
