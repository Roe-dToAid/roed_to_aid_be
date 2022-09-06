require 'rails_helper'

RSpec.describe 'resources GQL Endpoint', type: :request do
  describe 'happy path' do
    describe 'all resources' do
      it 'successfully returns all the resouces for a state' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        resource1 = Resource.create!(state_id: state.id, name: 'Funding4All', website: 'WebSite', service: 'funding',
                                     active: true, bipoc_focus: false)
        resource2 = Resource.create!(state_id: state.id, name: 'DriversRUs', website: 'Siteofweb',
                                     service: 'transportation', active: false, bipoc_focus: true)

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd',
             params: { query: resources(abbreviation: state.abbreviation) }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        resources = json['data']['state']['resources'].first

        expect(resources).to include(
          'stateId' => be_present,
          'name' => be_present,
          'website' => be_present,
          'service' => be_present,
          'active' => be_present,
          'bipocFocus' => be_present
        )
      end
    end
  end

  describe 'sad path' do
    describe 'all resources' do
      it 'returns error if no state match' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        clinic1 = AuthorizedClinic.create!(state_id: state.id, name: 'Planned Parenthood',
                                           address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87_108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage', source: 'abortionfinder.org')
        clinic2 = AuthorizedClinic.create!(state_id: state.id, name: 'Fake Clinic', address: '123 Seaside Ln',
                                           city: 'Atlantis', zip: 87_345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage', source: 'abortionfinder.org')

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd',
             params: { query: resources(abbreviation: 'TRK') }

        expect(response).to be_successful

        json = JSON.parse(response.body)

        expect(json).to eq({ 'data' => { 'state' => nil } })
      end
    end
  end

  def resources(abbreviation:)
    <<~GQL
      query {
        state(abbreviation: "#{abbreviation}") {
          name
          resources {
            stateId
            name
            website
            service
            active
            bipocFocus
          }
        }
      }
    GQL
  end
end
