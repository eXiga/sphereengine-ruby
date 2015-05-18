module SphereEngine
  class SphereEngineClient
    attr_accessor :access_token
    
    def initialize(token)
      @access_token = token
    end

    def test_connection
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::TEST_ENDPOINT + access_token.to_s)
      Net::HTTP.get(uri)
    end
  end
end