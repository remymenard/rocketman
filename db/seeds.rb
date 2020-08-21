# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "csv"

puts "[1/5] Cleaning database..."
Review.delete_all
Order.delete_all
Rocket.delete_all
User.delete_all
puts "[1/5] Finished!"

puts "[2/5] Creating 10 fake users..."

user = User.create!(first_name: "Jean Michel",
  last_name: "Dupont",
  email: "test@exemple.com",
  password: "password")

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(first_name: first_name,
                  last_name: last_name,
                  email: "#{first_name.downcase}.#{last_name.downcase}@exemple.com",
                  password: "password")

  cities = CSV.parse(File.read(Rails.root.join("lib/avatar.csv")))
  CSV.foreach(Rails.root.join("lib/rockets.csv")) do |row|
    user.picture = row[0]
  end

  user.save!
end

puts "[2/5] Finished!"

puts "[3/5] Creating fake rockets from the csv..."

equipment = ['Wifi', 'Fitness room', 'Cinema', 'Jacuzzi', 'Spa', 'Booling', 'Golf court', 'Observatory', 'Horse riding', "Cocktail's bar", 'Skiing', 'Head cook']

i = 0
total = 0
cities = CSV.parse(File.read(Rails.root.join("lib/cities.csv")))
rockets = CSV.parse(File.read(Rails.root.join("lib/rockets.csv")))

59.times do
  i = 0 if i == 10
  rocket = Rocket.new(owner: User.all.sample,
                      daily_price: rand(100..999),
                      name: Faker::Space.galaxy,
                      address: cities[total].first,
                      rooms_number: rand(1..10),
                      beds_number: rand(1..10),
                      bathrooms_number: rand(1..10),
                      travellers_number: rand(1..10),
                      equipments: equipment.sample(rand(4..6)))
  # sleep 0.5
  image = URI.open(rockets[i].first)
  rocket.photo.attach(io: image, filename: "rocket#{total}.jpg", content_type: "image/jpg")
  rocket.save!
  i += 1
  total += 1
  puts "#{total}/56"
end


# rocket = Rocket.last
# image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Soyuz_TMA-9_launch.jpg/440px-Soyuz_TMA-9_launch.jpg")
# arr_of_rows = CSV.read(image_tag "rockets/.png", **options)
# rocket.photo.attach(io: image, filename: "rocket.jpg", content_type: "image/jpg")
# puts rocket.photo.attached?

puts "[3/5] Finished!"

puts "[4/5] Creating some fake reviews..."

Rocket.all.each do |rocket|
  rand(3..6).times do
    review = Review.new(user: User.all.sample,
                        rocket: rocket,
                        rating: rand(1..5),
                        description: Faker::Restaurant.review)
    review.save!
  end
end


puts "[3/5] Finished!"

puts "[5/5] Creating 20 fake orders..."
20.times do
  begin_date = Faker::Date.between(from: 40.days.ago, to: -30.days.ago)
  days = rand(4..10)
  end_date = begin_date + days
  order = Order.new(rocket: Rocket.all.sample,
                    renter: User.all.sample,
                    begin_date: begin_date,
                    end_date: end_date)

  order.total_price = days * order.rocket.daily_price
  order.save!
end
puts "[5/5] Finished!"
