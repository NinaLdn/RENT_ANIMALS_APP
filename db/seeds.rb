# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

puts 'Creating 100 fake users...'
100.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    second_name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    password: Faker::Internet.password,
    email: Faker::Internet.email
  )
  user.save!
end



Animal.destroy_all

puts 'Creating 30 fake animals...'
30.times do
  animal = Animal.new(
    name: Faker::Name.first_name,
    category: Faker::Dog.breed,
    price: Faker::Commerce.price,
    user_id: User.all.sample.id
  )
  animal.save!
end

puts 'Finished!'
