require 'spec_helper'

RSpec.describe 'a test request' do
  before do
    host 'caleb.qa2.recurlyqa.com'
    private_key ENV['API_KEY']
  end

  it 'sends a request' do
    post '/v2/accounts', params: { account: { account_code: 'abcdefg' } }

    expect(response.code).to eq(201)
  end
end
