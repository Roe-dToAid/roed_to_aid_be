require 'rails_helper'

RSpec.describe 'Resources Endpoint', type: :request do 
  describe 'resources#index' do 
    describe 'happy path' do 
      it 'displays resources for each state' do
        state = State.create!(name: "Texas", abbreviation: "TX", legal: 2, legal_description: "banned as heck", source: "website")
        get "/api/v1/states/#{state.id}/resources"

        expect(response).to be_successful
        binding.pry
      end
    end
  end
end