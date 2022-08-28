require 'rails_helper'

RSpec.describe 'Authorized Clinic Endpoint', type: :request do
  let!(:user) { User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd') }
  let!(:body) { {api_key: '1b86bdaac6dde78337da1a8618f71bfd'} }

  describe 'happy path' do
    describe 'index endpoint' do
      it 'returns all authorized clinics' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck', source: 'website')
        state2 = State.create!(name: 'New Mexico', abbreviation: 'NM', legal: 0, legal_description: 'fully legal', source: 'website')

        clinic1 = AuthorizedClinic.create!(state_id: state.id, name: 'Planned Parenthood', address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage')
        clinic2 = AuthorizedClinic.create!(state_id: state2.id, name: 'Fake Clinic', address: '123 Seaside Ln', city: 'Atlantis', zip: 87345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage')

        get '/api/v1/authorized_clinics', params: body

        expect(response).to be_successful

        clinics = JSON.parse(response.body, symbolize_names: true)
        # binding.pry
        expect(clinics).to be_a(Hash)
        expect(clinics[:data].count).to eq(2)
        expect(clinics[:data].first[:attributes].count).to eq(8)
        expect(clinics[:data].first[:attributes]).to have_key(:name)
        expect(clinics[:data].first[:attributes]).to have_key(:address)
        expect(clinics[:data].first[:attributes]).to have_key(:services)
      end
    end

    describe 'show endpoint' do
      it 'returns successful but empty with no clinics' do
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck', source: 'website')
        state2 = State.create!(name: 'New Mexico', abbreviation: 'NM', legal: 0, legal_description: 'fully legal', source: 'website')

        clinic1 = AuthorizedClinic.create!(state_id: state2.id, name: 'Planned Parenthood', address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage')
        clinic2 = AuthorizedClinic.create!(state_id: state2.id, name: 'Fake Clinic', address: '123 Seaside Ln', city: 'Atlantis', zip: 87345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage')

        get '/api/v1/states/TX/authorized_clinics', params: body

        expect(response).to be_successful

        clinics = JSON.parse(response.body, symbolize_names: true)

        expect(clinics).to be_a(Hash)
        expect(clinics[:data].count).to eq(0)
      end
    end
  end
end
