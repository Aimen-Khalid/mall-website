class Store < ApplicationRecord
	has_many :products
	has_one_attached :logo
	validates :store_name, :address, :mail, presence: true
	validates :address, :mail, length: {maximum: 100}
	validates :store_name, length: {maximum: 50}
	validates :description, length: {maximum: 150}
end
