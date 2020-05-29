# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

products = []

50.times do |index|
  product = Product.create!(name: Faker::Food.dish,
                          cost: Faker::Number.decimal(l_digits: 2),
                          country: Faker::WorldCup.team)
  products.push(product)                        
  end

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::FunnyName.two_word_name,
                          content: Faker::Lorem.characters(number: 55),
                          rating: Faker::Number.between(from: 1, to: 5),
                          product_id: products[rand(products.length)].id)
  end


p "Created #{Product.count} products!"
p "Created #{Review.count} reviews!"