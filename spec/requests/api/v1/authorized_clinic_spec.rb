require 'rails_helper'

RSpec.describe 'Authorized Clinic Endpoint', type: :request do 
  describe 'happy path' do 
    describe 'index endpoint' do 
      it 'returns all authorized clinics' do 
        state = State.create!(name: 'Texas', abbreviation: 'TX', legal: 2, legal_description: 'banned as heck', source: 'website')
        clinic1 = AuthorizedClinic.create!(state_id: state.id, name: 'Planned Parenthood', address: 'its sad because there actually arent any clinics in TX', city: 'Houston', zip: 87108, phone: '5555555555', services: 'pill, clinic', website: 'a super cool webpage')
        clinic2 = AuthorizedClinic.create!(state_id: state.id, name: 'Fake Clinic', address: '123 Seaside Ln', city: 'Atlantis', zip: 87345, phone: '4556439900', services: 'clinic', website: 'another super cool webpage')

        get '/api/v1/authorized_clinics'

        expect(response).to be_successful
      end
    end
  end
end