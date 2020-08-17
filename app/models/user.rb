class User < ApplicationRecord
  has_many :rockets, foreign_key: :owner_id
  has_many :orders, foreign_key: :renter_id
  has_many :owner_orders, through: :rockets, source: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
