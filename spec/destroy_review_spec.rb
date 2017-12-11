require 'rails_helper'
require 'factories'

describe 'destroy reviews route', :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 1)}


  before do
    last_review = Review.last
    delete "/reviews/#{last_review.id}"
  end

  it 'destroys the review and returns' do
    expect(response).to have_http_status(:no_content)
  end
end
