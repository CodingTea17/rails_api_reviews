class ReviewsController < ApplicationController
  include Response

  def index
    @reviews = Review.all
    @reviews = @reviews.destination_filter(params[:destination]) if params[:destination].present?
    @reviews = @reviews.popular_by_destination(params[:pop_des]) if params[:pop_des] === "true"
    if params[:rand_rev] === "true"
      random_review = ""
      loop do
        random_review = @reviews.random_review(params[:rand_rev])
        break if random_review.any?
      end
      @reviews = random_review
    end
    json_response(@reviews)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      render status: 200, json: {
        updated: "Your review has been updated, Get Schwiftty!"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.author === params[:author]
      json_response(@review.destroy, :ok)
    else
      render status: :unauthorized, json: {
        not_authorized: "You are not authorized to remove this review"
      }
    end
  end

  private

  def review_params
    params.permit(:author, :content, :destination)
  end
end
