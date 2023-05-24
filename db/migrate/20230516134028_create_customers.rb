class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :fullName
      t.string :phone
      t.boolean :gender
      t.string :description

      t.timestamps
    end
  end
end
