class Review < ApplicationRecord
  belongs_to :rocket
  belongs_to :user

  validates :rocket, presence: true
  validates :user, presence: true

  validates :description, length: { maximum: 255 }

  validates :rating, :inclusion => { in: 1..2 }
end
