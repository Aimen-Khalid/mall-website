class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :store_id
      t.string :product_name
      t.string :product_description
      t.string :category
      t.integer :price
      t.date :order_date

      t.timestamps
    end
  end
end
