require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK with correct content' do
      # Assuming the post with id 1 exists.
      response = get('/names')
      expected_result = "Julia, Mary, Karim"
      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_result)
    end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "GET /hello" do
    it "conatains html" do
      response = get('/hello')

      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end
