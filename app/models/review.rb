class Review < ApplicationRecord
  scope :destination_filter, -> (planet) { where(destination: planet) }
  scope :popular_by_destination, -> (t_f) { Review.select(" destination, count(destination) as reviews_count")
                      .group("reviews.destination")
                      .order("reviews_count DESC")
                      .limit(1)}

  scope :random_review, -> (t_f) { where(id: rand(Review.first.id..Review.last.id))}
end
