require 'rails_helper'

RSpec.describe 'Authorized Clinics GQL Endpoint', type: :request do
  describe 'happy path' do 
    describe 'all centers' do 
      it 'successfully returns all the clinics' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck',
          source: 'website')

          clinic1 = AuthorizedClinic.create!(state_id: state.id, name: 'Planned Parenthood',
            address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87_108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage', source: 'abortionfinder.org')
          clinic2 = AuthorizedClinic.create!(state_id: state.id, name: 'Fake Clinic', address: '123 Seaside Ln',
            city: 'Atlantis', zip: 87_345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage', source: 'abortionfinder.org')

        user = User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd')

        post '/graphql?api_key=1b86bdaac6dde78337da1a8618f71bfd', params: { query: authorized_clinics(abbreviation: state.abbreviation) }

        expect(response).to be_successful
        json = JSON.parse(response.body)
        # binding.pry
        clinics = json['data']['state']['authorizedClinics'].first

        expect(clinics).to include(
          'stateId' => be_present,
          'phone' => be_present,
          'name' => be_present,
          'address' => be_present,
          'city' => be_present,
          'zip' => be_present,
          'services' => be_present,
          'website' => be_present,
          'source' => be_present
        )
      end
    end
  end

  def authorized_clinics(abbreviation:)
    <<~GQL
      query {
        state(abbreviation: "#{abbreviation}") {
          name 
          authorizedClinics {
            stateId
            name
            address
            website
            city
            zip
            phone
            services
            source
          }
        }
      }
    GQL
  end
end