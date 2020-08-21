class Review < ApplicationRecord
  belongs_to :rocket
  belongs_to :user

  validate :rocket, presence: true
  validate :user, presence: true

  validate :description, length: { maximum: 255 }

  validate :rating, in: 0..5
end
