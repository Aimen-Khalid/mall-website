class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :products_count

      t.timestamps
    end
  end
end
