# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.dish,
                          cost: Faker::Number.decimal(l_digits: 2),
                          country: Faker::WorldCup.team)
  end

Review.destroy_all

250.times do |index|
  Review.create!(author: Faker::FunnyName.two_word_name,
                          content: Faker::Lorem.sentence(word_count: 55).chop,
                          rating: Faker::Number.between(from: 1, to: 5))
  end


p "Created #{Product.count} products!"
p "Created #{Review.count} reviews!"

# Keyword arguments: word_count, supplemental, random_words_to_add
# The 'random_words_to_add' argument increases the sentence's word count by a random value within (0..random_words_to_add).
# To specify an exact word count for a sentence, set word_count to the number you want and random_words_to_add equal to 0.
# By default, sentences will not have any random words added (and will all be exactly 4 words long)