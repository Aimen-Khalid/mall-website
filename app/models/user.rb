class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_one :cart
	enum user_type: [:Buyer, :Seller, :Admin]

	validates :name, :address, presence: true
	validates :address, :email, length: {maximum: 100}
	validates :name, length: {maximum: 50}
	validates :email, length: {maximum: 150}
end
