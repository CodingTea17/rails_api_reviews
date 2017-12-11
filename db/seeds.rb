# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        author: Faker::RickAndMorty.character,
        content: Faker::RickAndMorty.quote,
        destination: Faker::RickAndMorty.location
      )
      puts "review #{i}: Author is #{review.author}, Review is '#{review.content}, Destination is #{review.destination}'."
    end
  end
end

Seed.begin
