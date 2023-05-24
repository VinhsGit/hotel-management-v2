class CreateBookRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :book_rooms do |t|
      t.date :checkIn
      t.date :checkOut
      t.string :description
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
