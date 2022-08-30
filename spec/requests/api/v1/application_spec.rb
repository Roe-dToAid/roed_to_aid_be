require 'rails_helper'

RSpec.describe 'api_key' do
  let!(:user) { User.create!(email: 'test user', token: '1b86bdaac6dde78337da1a8618f71bfd') }
  let!(:body) { { api_key: '1b86bdaac6dde78337da1a8618f71bfd' } }

  it 'should respond with a propper error if no api key is given' do
    get '/api/v1/states/not_real/misinformation_centers'

    expect(response).to_not be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    error_message = { data: { id: nil, type: 'error', message: 'Api key is invalid' } }

    expect(data).to eq(error_message)
  end

  it 'should respond with a propper error if the api key given is not valid' do
    invalid_key = { api_key: '1b86bdaac6dde78337da1a8618f71bfffffff' }
    get '/api/v1/states/TX/misinformation_centers', params: invalid_key

    expect(response).to_not be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    error_message = { data: { id: nil, type: 'error', message: 'Api key is invalid' } }

    expect(data).to eq(error_message)
  end
end
