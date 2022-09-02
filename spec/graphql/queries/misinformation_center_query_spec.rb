require 'rails_helper'

RSpec.describe 'Misinformation GQL Endpoint', type: :request do
  describe 'happy path' do 
    describe 'all centers' do 
      it 'successfully returns all the centers' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
          source: 'website')

        center1 = MisinformationCenter.create!(
        {
        "state_id": state.id,
        "name": "PREGNANCY RESOURCES OF ABILENE\nOF ABILENE",
        "address": '2110 North Willis Street Abilene',
        "city": "Houston",
        "zip": "79106",
        "source": 'reproaction.org'
        }
        )

        center2 = MisinformationCenter.create!(
        {
        "state_id": state.id,
        "name": "CARE NET PREGNANCY CENTER - MEDIPARK\nCENTER - MEDIPARK",
        "address": "6709 Woodward Amarillo Street",
        "city": "Houston",
        "zip": "79106",
        "source": 'reproaction.org'
        }
        )

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd', params: { query: misinformation_centers(abbreviation: state.abbreviation) }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        # binding.pry
        centers = json['data']['state']['misinformationCenters'].first

        expect(centers).to include(
          'stateId' => be_present,
          'name' => be_present,
          'address' => be_present,
          'city' => be_present,
          'zip' => be_present,
          'source' => be_present,
        )
      end
    end
  end

  def misinformation_centers(abbreviation:)
    <<~GQL
      query {
        state(abbreviation: "#{abbreviation}") {
          name 
          misinformationCenters {
            stateId
            name
            address
            source
            city
            zip
          }
        }
      }
    GQL
  end
end