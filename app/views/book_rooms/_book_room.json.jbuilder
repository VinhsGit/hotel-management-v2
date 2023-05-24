json.extract! book_room, :id, :checkIn, :checkOut, :description, :room_id, :customer_id, :created_at, :updated_at
json.url book_room_url(book_room, format: :json)
