require 'spec_helper'
include WebMock::API

describe SphereEngine::SphereEngineClient do
  before :each do
    @client = SphereEngine::SphereEngineClient.new('qwerty123')
    stub_request(:get, SphereEngine::Request::BASE_URL + 
                       SphereEngine::Request::TEST_ENDPOINT + @client.access_token.to_s).
      to_return(body: fixture('test_connection_response.json'))
  end

  describe "#new" do
    it 'should be created with access token' do
      expect(@client.access_token).to eq('qwerty123')
    end
  end

  describe '#test_connection' do
    before :each do
      @response =  JSON.parse @client.test_connection 
    end

    it 'should make test request to api' do
      expect(WebMock).to have_requested(:get, SphereEngine::Request::BASE_URL + 
                                              SphereEngine::Request::TEST_ENDPOINT + @client.access_token.to_s)
    end

    it 'should get valid response' do
      expect(@response).to be_an_instance_of Hash
    end
    
    it 'should get valid response content' do
      expect(@response['moreHelp']).to eq "sphere-engine.com"
      expect(@response['pi']).to eq 3.14
      expect(@response['answerToLifeAndEverything']).to eq 42
      expect(@response['oOok']).to eq true
    end
  end
end