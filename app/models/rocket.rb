class Rocket < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner, class_name: 'User'
  has_many :orders

  validates :photo, presence: true

  validates :owner, presence: true

  validates :daily_price, numericality: { only_integer: true }

  validates :name, presence: true, allow_blank: false
  validates :location, presence: true, allow_blank: false
  validates :autonomy, presence: true, allow_blank: false
end
