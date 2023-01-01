class ChangeUserToCart < ActiveRecord::Migration[7.0]
  def change
    rename_column :cart_products, :user_id, :cart_id
  end
end
