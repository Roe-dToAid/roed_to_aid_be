require 'rails_helper'

RSpec.describe 'Misinformation GQL Endpoint', type: :request do
  describe 'happy path' do 
    describe 'all centers' do 
      it 'successfully returns all the centers' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
          source: 'website')

        resource1 = Resource.create!(state_id: state.id, name: 'Funding4All', website: 'WebSite', service: 'funding',active: true, bipoc_focus: false)
        resource2 = Resource.create!(state_id: state.id, name: 'DriversRUs', website: 'Siteofweb', service: 'transportation', active: false, bipoc_focus: true)

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd', params: { query: resources(abbreviation: state.abbreviation) }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        resources = json['data']['state']['resources'].first

        expect(resources).to include(
          'stateId' => be_present,
          'name' => be_present,
          'website' => be_present,
          'service' => be_present,
          'active' => be_present,
          'bipocFocus' => be_present,
        )
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