require 'rails_helper'
require 'factories'

describe "get all reviews route", :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 20)}

  before { get '/reviews'}

  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "returns failed request", :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 20)}

  before { get '/reviews/200'}

  it 'returns error status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end

describe "returns a review", :type => :request do
  let!(:reviews) { FactoryBot.create_list(:review, 20)}


  before do
    last_review = Review.last
    get "/reviews/#{last_review.id}"
  end

  it "returns a review" do
    expect(JSON.parse(response.body).size).to eq(6)
  end
end
