# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'States API', type: :request do
  let!(:state1) { State.create!(name: "Texas", abbreviation: "TX", legal: 2, legal_description: "lorem ipsum_TX", source: "website_here_TX") }
  let!(:state2) { State.create!(name: "New Mexico", abbreviation: "NM", legal: 0, legal_description: "lorem ipsum_NM", source: "website_here_NM") }

  describe 'States#index' do
    describe 'happy paths' do
      it 'displays all the states' do
        get '/api/v1/states'

        expect(response).to be_successful

        json = JSON.parse(response.body, symbolize_names: true)
        states = json[:data]

        expect(states.count).to eq(2)
        expect(states.first[:attributes].keys).to include(:name, :abbreviation, :legal, :legal_description, :source)
      end
    end
  end
end
