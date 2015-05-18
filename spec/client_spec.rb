require 'spec_helper'
include WebMock::API

describe SphereEngine::SphereEngineClient do
  before :each do
    @client = SphereEngine::SphereEngineClient.new('qwerty123')
  end

  describe "#new" do
    it 'should be created with access token' do
      expect(@client.access_token).to eq('qwerty123')
    end
  end

  describe '#test_connection' do
    before :each do
      stub_request(:get, SphereEngine::Request::BASE_URL + 
                         SphereEngine::Request::TEST_ENDPOINT + @client.access_token.to_s).
      to_return(body: fixture('test_connection_response.json'))
      @response = @client.test_connection 
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

  describe '#languages' do
    before :each do
      stub_request(:get, SphereEngine::Request::BASE_URL +
                         SphereEngine::Request::LANGUAGES_ENDPOINT + @client.access_token.to_s).
      to_return(body: fixture('languages_response.json'))
      @response = @client.languages
    end

    it 'should make languages request to api' do
      expect(WebMock).to have_requested(:get, SphereEngine::Request::BASE_URL +
                                              SphereEngine::Request::LANGUAGES_ENDPOINT + @client.access_token.to_s)
    end

    it 'should get valid response' do
      expect(@response).to be_an_instance_of Hash
    end

    it 'should get valid response content' do
      expect(@response['11']).to eq "C (gcc-4.9.2)"
    end
  end

  describe '#send_submission' do
    before :each do
      stub_request(:post, SphereEngine::Request::BASE_URL +
                          SphereEngine::Request::SUBMISSIONS_ENDPOINT + @client.access_token.to_s).
      to_return(body: fixture('submissions_response.json'))
      @response = @client.send_submission(nil, 11, nil)
    end

    it 'should make submissions request to api' do
      expect(WebMock).to have_requested(:post, SphereEngine::Request::BASE_URL +
                                               SphereEngine::Request::SUBMISSIONS_ENDPOINT + @client.access_token.to_s)
    end

    it 'should get valid response' do
      expect(@response).to be_an_instance_of Hash
    end

    it 'should get valid response content' do
      expect(@response.key?('id')).to eq true
    end
  end

  describe '#fetch_submission' do
    before :each do
      stub_request(:get, SphereEngine::Request::BASE_URL +
                         SphereEngine::Request::FETCH_SUBMISSION_ENDPOINT.sub(':id', 1.to_s) + @client.access_token.to_s).
      to_return(body: fixture('fetch_submission_response.json'))
      @response = @client.fetch_submission(1)
    end

    it 'should make fetch submission request to api' do
      expect(WebMock).to have_requested(:get, SphereEngine::Request::BASE_URL +
                                              SphereEngine::Request::FETCH_SUBMISSION_ENDPOINT.sub(':id', '1') + 
                                              @client.access_token.to_s)
    end

    it 'should get valid response' do
      expect(@response).to be_an_instance_of Hash
    end

    it 'should get valid response content' do
      expect(@response['langId']).to eq 21
      expect(@response['langName']).to eq 'Haskell'
      expect(@response['langVersion']).to eq '4.1'
      expect(@response['time']).to eq 3.0
      expect(@response['date']).to eq "2015-05-18"
      expect(@response['status']).to eq 0
      expect(@response['result']).to eq 15
      expect(@response['memory']).to eq 3000
      expect(@response['signal']).to eq 28
      expect(@response['source']).to eq "#include <iostream> int main () { std::cout << \"lol\" << std::endl; return 0; }"
      expect(@response['input']).to eq '0'
      expect(@response['output']).to eq 'lol'
      expect(@response['stderr']).to eq ''
      expect(@response['cmpinfo']).to eq ''
    end

  end
end