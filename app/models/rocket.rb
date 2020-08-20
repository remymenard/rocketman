require 'opencage/geocoder'

class Rocket < ApplicationRecord
CONTINENT = ['Africa', 'Antarctica', 'Asia', 'Europe', 'North America', 'Oceania', 'South America']

  has_one_attached :photo
  belongs_to :owner, class_name: 'User'
  has_many :orders

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  validate :manage_location
  validates :photo, presence: true

  validates :owner, presence: true

  validates :daily_price, numericality: { only_integer: true }

  validates :name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :autonomy, presence: true, allow_blank: false

  private
  def manage_location
    geocoder = OpenCage::Geocoder.new(api_key: ENV['OPENCAGE_KEY'])
    result = geocoder.geocode(self.address)
    unless result.empty?
      self.continent = result.first.components["continent"]
      self.latitude = result.first.lat
      self.longitude = result.first.lng
    else
      errors.add(:address, "Not a valid address")
    end
  end
end
