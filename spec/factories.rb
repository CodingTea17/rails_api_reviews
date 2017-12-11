FactoryBot.define do
  factory(:review) do
    author(Faker::RickAndMorty.character)
    content(Faker::RickAndMorty.quote)
    destination(Faker::RickAndMorty.location)
  end
end
