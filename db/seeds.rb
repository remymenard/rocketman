# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "[1/4] Cleaning database..."
Order.delete_all
Rocket.delete_all
User.delete_all
puts "[1/4] Finished!"

puts "[2/4] Creating 10 fake users..."

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(first_name: first_name,
                  last_name: last_name,
                  email: "#{first_name.downcase}.#{last_name.downcase}@exemple.com",
                  password: "password")
  user.save!
end
puts "[2/4] Finished!"

puts "[3/4] Creating 25 fake rockets..."
25.times do |index|
  rocket = Rocket.new(owner: User.all.sample,
                      daily_price: rand(100..999),
                      name: Faker::Space.galaxy,
                      location: Faker::Space.planet,
                      autonomy: rand(1..1000000))
  rocket.photo.attach(io: image, filename: "rocket#{index}.jpg", content_type: "image/jpg")
  rocket.save!
end
rocket = Rocket.last
image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Soyuz_TMA-9_launch.jpg/440px-Soyuz_TMA-9_launch.jpg")
rocket.photo.attach(io: image, filename: "rocket.jpg", content_type: "image/jpg")
puts rocket.photo.attached?

puts "[3/4] Finished!"

puts "[4/4] Creating 20 fake orders..."
20.times do
  begin_date = Faker::Date.between(from: 100.days.ago, to: 20.days.ago)
  days = rand(1..19)
  end_date = begin_date + days
  order = Order.new(rocket: Rocket.all.sample,
                    renter: User.all.sample,
                    begin_date: begin_date,
                    end_date: end_date,
                    total_price: rand(1..100000))
  order.total_price = days * order.rocket.daily_price
  order.save!
end
puts "[4/4] Finished!"
