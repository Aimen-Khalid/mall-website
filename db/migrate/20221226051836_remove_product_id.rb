class RemoveProductId < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :product_id
  end
end
