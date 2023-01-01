class Product < ApplicationRecord
	belongs_to :store
	has_one_attached :image
	has_many :cart_products, dependent: :destroy
  	has_many :carts, through: :cart_products

	validates :store_id, :product_name, :category, :price, :order_date, presence: true
	validates :product_name, :product_description, :category, length: {maximum: 50}
end
