class User < ApplicationRecord
  has_many :rockets, foreign_key: :owner_id
  has_many :orders, foreign_key: :renter_id
  has_many :owner_orders, through: :rockets, source: :orders

  validates :rockets, presence: true
  validates :orders, presence: true

  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
