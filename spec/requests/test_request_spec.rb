require 'spec_helper'

RSpec.describe 'a test request' do
  before do
    host 'caleb.qa2.recurlyqa.com'
    private_key ENV['API_KEY']
  end

  it 'sends a request', card: "PAY-4980" do
    post '/v2/accounts', params: { account: { account_code: 'abcdefg' } }

    expect(response.code).to eq(201)
  end

  it 'succeeds', card: "PAY-5032" do
    expect(true).to eq(true)
  end

  it 'makes a card', card: "PAY-5055" do
    expect(true).to eq(false)
  end
end
