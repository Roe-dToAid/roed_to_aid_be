require 'rails_helper'

RSpec.describe 'Misinformation Centers Endpoint', type: :request do
  describe 'happy path' do
    describe '#index' do
      it 'returns all misinformation centers' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        center1 = MisinformationCenter.create!(
          {
            "state_id": state.id,
            "name": "PREGNANCY RESOURCES OF ABILENE\nOF ABILENE",
            "address": '2110 North Willis Street Abilene, TX 79603   ',
            "source": 'reproaction.org'
          }
        )

        center2 = MisinformationCenter.create!(
          {
            "state_id": state.id,
            "name": "CARE NET PREGNANCY CENTER - MEDIPARK\nCENTER - MEDIPARK",
            "address": "6709 Woodward Amarillo Street, TX 79106                \n",
            "source": 'reproaction.org'
          }
        )

        get '/api/v1/misinformation_centers'

        expect(response).to be_successful

        centers = JSON.parse(response.body, symbolize_names: true)

        expect(centers).to be_a(Hash)
        expect(centers[:data].count).to eq(2)
        expect(centers[:data].first[:attributes]).to have_key(:name)
        expect(centers[:data].first[:attributes]).to have_key(:address)
        expect(centers[:data].first[:attributes]).to have_key(:source)
      end
    end
    describe '#show' do
      it 'returns centers for a particular state' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
                              source: 'website')

        state2 = State.create!(name: 'Frank', abbreviation: 'Tank', legal: 2, legal_description: 'banned as heck',
                               source: 'website')

        center1 = MisinformationCenter.create!(
          {
            "state_id": state.id,
            "name": "PREGNANCY RESOURCES OF ABILENE\nOF ABILENE",
            "address": '2110 North Willis Street Abilene, TX 79603   ',
            "source": 'reproaction.org'
          }
        )

        center2 = MisinformationCenter.create!(
          {
            "state_id": state.id,
            "name": "CARE NET PREGNANCY CENTER - MEDIPARK\nCENTER - MEDIPARK",
            "address": "6709 Woodward Amarillo Street, TX 79106                \n",
            "source": 'reproaction.org'
          }
        )

        center3 = MisinformationCenter.create!(
          {
            "state_id": state2.id,
            "name": 'What is my name?!',
            "address": "6709 Woodward Amarillo Street, TX 79106                \n",
            "source": 'reproaction.org'
          }
        )

        get '/api/v1/states/TX/misinformation_centers'

        expect(response).to be_successful

        centers = JSON.parse(response.body, symbolize_names: true)

        expect(centers).to be_a(Hash)
        expect(centers[:data].count).to eq(2)
        expect(centers[:data].first[:attributes]).to have_key(:name)
        expect(centers[:data].first[:attributes]).to have_key(:address)
        expect(centers[:data].first[:attributes]).to have_key(:source)
      end
    end
  end
end
