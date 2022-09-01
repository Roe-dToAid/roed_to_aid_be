require 'rails_helper'

RSpec.describe 'GraphQL State Queries', type: :request do
  describe 'states' do 
    describe 'happy paths' do
      it 'successfully queries the API' do 
        state1 = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'lorem ipsum_TX',
        source: 'website_here_TX')
        state2 = State.create!(name: 'New Mexico', abbreviation: 'NM', legal: 0, legal_description: 'lorem ipsum_NM',
          source: 'website_here_NM')

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')
        body = { api_key: '1b86bdaac6dde78337da1a8618f71bfd' }

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd', params: { query: states }

        expect(response).to be_successful
      end
    end
  end

  def states
    <<~GQL
      query {
        states {
          name
        }
      }
    GQL
  end
end

