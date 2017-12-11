class Review < ApplicationRecord
  scope :destination_filter, -> (planet) { where(destination: planet) }
  scope :popular_by_destination, -> (t_f) { Review.select("reviews.destination, count(reviews.destination) as reviews_count").group("reviews.destination").order("reviews_count DESC").limit(1) }

  scope :random_review, -> (t_f) { where(id: rand(Review.first.id..Review.last.id)) }
  scope :result_limit, -> (page) { paginate(:page => page, :per_page => 10) }
end
