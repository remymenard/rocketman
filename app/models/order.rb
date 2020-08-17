class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :renter, class_name: 'User'

  validates :rocket, presence: true
  validates :renter, presence: true

  validates :begin_date, presence: true, allow_blank: false
  validates :end_date, presence: true, allow_blank: false

  validates :total_price, numericality: { only_integer: true }

end
