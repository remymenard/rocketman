class Review < ApplicationRecord
  belongs_to :rocket
  belongs_to :user

  validates :rocket, presence: true
  validates :user, presence: true

  validates :description, presence: true

  validates :rating, :inclusion => { in: 1..5 }
end
