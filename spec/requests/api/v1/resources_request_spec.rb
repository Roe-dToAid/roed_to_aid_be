require 'rails_helper'

RSpec.describe 'Resources Endpoint', type: :request do
  let!(:user) { User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd') }
  let!(:body) { {api_key: '1b86bdaac6dde78337da1a8618f71bfd'} }

  describe 'resources#index' do
    describe 'happy path' do
      it 'displays resources for each state' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        state2 = State.create!(name: 'Frank', abbreviation: 'Tank', legal: 2, legal_description: 'banned as heck',
                               source: 'website')
        resource1 = Resource.create!(state_id: state.id, name: 'Funding4All', website: 'WebSite', service: 'funding',
                                     active: true, bipoc_focus: false)
        resource2 = Resource.create!(state_id: state.id, name: 'DriversRUs', website: 'Siteofweb',
                                     service: 'transportation', active: false, bipoc_focus: true)
        resource3 = Resource.create!(state_id: state2.id, name: 'blah', website: 'Siteofweb',
                                     service: 'transportation', active: false, bipoc_focus: true)
        get "/api/v1/states/#{state.abbreviation}/resources", params: body

        expect(response).to be_successful

        resources = JSON.parse(response.body, symbolize_names: true)

        expect(resources).to be_a(Hash)
        expect(resources[:data].count).to eq(2)
        expect(resources[:data].first[:attributes].count).to eq(6)
      end

      it 'returns all resources' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')
        resource1 = Resource.create!(state_id: state.id, name: 'Funding4All', website: 'WebSite', service: 'funding',
                                     active: true, bipoc_focus: false)
        resource2 = Resource.create!(state_id: state.id, name: 'DriversRUs', website: 'Siteofweb',
                                     service: 'transportation', active: false, bipoc_focus: true)

        get '/api/v1/resources', params: body

        expect(response).to be_successful

        resources = JSON.parse(response.body, symbolize_names: true)

        expect(resources).to be_a(Hash)
        expect(resources[:data].count).to eq(2)
        expect(resources[:data].first[:attributes].count).to eq(6)
      end
    end
  end
end
