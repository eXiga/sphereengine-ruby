require 'spec_helper'

describe SphereEngine::SphereEngineClient do
  before :each do
    @client = SphereEngine::SphereEngineClient.new('qwerty123')
  end

  describe "#new" do
    it 'should be created with access token' do
      expect(@client.access_token).to eq('qwerty123')
    end
  end
end