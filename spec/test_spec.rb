# frozen_string_literal: true

require 'rack/test'
require 'elias/api/application'

RSpec.describe 'API' do
  subject(:response) { get '/' }

  include Rack::Test::Methods

  let(:app) { Elias::API::Application }

  specify do
    expect(response.status).to eq 200
    expect(response.body).to eq <<~JSON.strip
      [{"id":1,"number":"ticket#1"},{"id":2,"number":"ticket#2"}]
    JSON
  end
end
