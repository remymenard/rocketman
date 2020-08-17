class Order < ApplicationRecord
  belongs_to :rocket
  belongs_to :renter, class_name: 'User'
end
