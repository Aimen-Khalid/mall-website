class Cart < ApplicationRecord
	belongs_to :user

	has_many :cart_products, dependent: :destroy
  	has_many :products, through: :cart_products

	validates :products_count, presence: true
end
