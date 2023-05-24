class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :bedNum
      t.string :description
      t.boolean :isAvailable
      t.date :checkOutDate

      t.timestamps
    end
  end
end
