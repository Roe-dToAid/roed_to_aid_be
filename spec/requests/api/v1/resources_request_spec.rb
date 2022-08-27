require 'rails_helper'

RSpec.describe 'Resources Endpoint', type: :request do 
  describe 'resources#index' do 
    describe 'happy path' do 
      it 'displays resources for each state' do
        state = State.create!(name: "Texas", abbreviation: "TX", legal: 2, legal_description: "banned as heck", source: "website")
        resource1 = Resource.create!(state_id: state.id, name: 'Funding4All', website: 'WebSite', service: 'funding', active: true, bipoc_focus: false)
        resource2 = Resource.create!(state_id: state.id, name: 'DriversRUs', website: 'Siteofweb', service: 'transportation', active: false, bipoc_focus: true)
        get "/api/v1/states/#{state.id}/resources"

        expect(response).to be_successful
        binding.pry
      end
    end
  end
end