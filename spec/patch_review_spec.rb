require 'rails_helper'
require 'factories'

describe 'update review route (patch)', :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 1)}


  before do
    last_review = Review.last
    patch "/reviews/#{last_review.id}", params: { :author => "Bob"}
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
