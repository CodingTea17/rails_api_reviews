require 'rails_helper'

describe "post a review route", :type => :request do

  before do
    post '/reviews', params: { :author => 'Small Arm Sanchez', :content => 'Now thats what I call a good muffin', :destination => "Grondo's Province" }
  end

  it 'returns the author name' do
    expect(JSON.parse(response.body)['author']).to eq('Small Arm Sanchez')
  end

  it 'returns the review content' do
    expect(JSON.parse(response.body)['content']).to eq('Now thats what I call a good muffin')
  end

  it 'returns the review destination' do
    expect(JSON.parse(response.body)['destination']).to eq("Grondo's Province")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
