require 'rails_helper'

RSpec.describe 'States API', type: :request do
  let!(:state1) do
    State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'lorem ipsum_TX',
                  source: 'website_here_TX')
  end
  let!(:state2) do
    State.create!(name: 'New Mexico', abbreviation: 'NM', legal: 0, legal_description: 'lorem ipsum_NM',
                  source: 'website_here_NM')
  end
  let!(:user) { User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd') }
  let!(:body) { { api_key: '1b86bdaac6dde78337da1a8618f71bfd' } }

  describe 'States#index' do
    describe 'happy paths' do
      it 'displays all the states' do
        get '/api/v1/states', params: body

        expect(response).to be_successful

        json = JSON.parse(response.body, symbolize_names: true)
        states = json[:data]

        expect(states.count).to eq(2)
        expect(states.first[:attributes].keys).to include(:name, :abbreviation, :legal, :legal_description, :source)
      end
    end
  end

  describe 'States#show' do
    describe 'happy paths' do
      it 'displays an individual state' do
        get '/api/v1/states/TX', params: body

        expect(response).to be_successful

        json = JSON.parse(response.body, symbolize_names: true)
        state = json[:data]

        expect(state.keys.count).to eq(3)
        expect(state[:id]).to eq(state1.id.to_s)
        expect(state[:type]).to eq('state')
        expect(state[:attributes].keys).to include(:name, :abbreviation, :legal, :legal_description, :source)
      end
    end
  end

  describe 'sad path' do
    describe '#show' do
      it 'returns a proper error message if abbreviation is invalid' do
        get '/api/v1/states/not_real', params: body

        expect(response).to_not be_successful

        centers = JSON.parse(response.body, symbolize_names: true)

        error_message = { data: { id: nil, type: 'error', message: 'Abbreviation is invalid' } }

        expect(centers).to eq(error_message)
      end
    end
  end
end
