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

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd', params: { query: states }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        states = json['data']['states']

        expect(json).to be_a(Hash)
        expect(states).to include(
          'name' => be_present,
          'abbreviation' => be_present,
          'legal' => be_present,
          'legalDescription' => be_present,
          'source' => be_present
        )
      end
    end
  end

  describe 'state' do
    describe 'happy paths' do
      it 'successfully queries the API' do
        state1 = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'lorem ipsum_TX',
                               source: 'website_here_TX')
        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd',
             params: { query: state(abbreviation: state1.abbreviation) }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        states = json['data']['state']

        expect(json).to be_a(Hash)
        expect(states).to include(
          'name' => be_present,
          'abbreviation' => be_present,
          'legal' => be_present,
          'legalDescription' => be_present,
          'source' => be_present
        )
      end
    end
  end

  describe 'sad path' do
    describe 'single state' do
      it 'returns error if no state match' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        clinic1 = AuthorizedClinic.create!(state_id: state.id, name: 'Planned Parenthood',
                                           address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87_108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage', source: 'abortionfinder.org')
        clinic2 = AuthorizedClinic.create!(state_id: state.id, name: 'Fake Clinic', address: '123 Seaside Ln',
                                           city: 'Atlantis', zip: 87_345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage', source: 'abortionfinder.org')

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd',
             params: { query: state(abbreviation: 'TRK') }

        expect(response).to be_successful

        json = JSON.parse(response.body)

        expect(json).to eq({ 'data' => { 'state' => nil } })
      end
    end
  end
  def states
    <<~GQL
      query {
        states {
          name
          abbreviation
          legal
          legalDescription
          source
        }
      }
    GQL
  end

  def state(abbreviation:)
    <<~GQL
      query {
        state(abbreviation: "#{abbreviation}") {
          name
          abbreviation
          legal
          legalDescription
          source
        }
      }
    GQL
  end
end
