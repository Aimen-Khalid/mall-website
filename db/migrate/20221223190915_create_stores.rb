class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :description
      t.string :address
      t.integer :phone_number
      t.string :mail

      t.timestamps
    end
  end
end
