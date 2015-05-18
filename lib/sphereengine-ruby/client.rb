module SphereEngine
  class SphereEngineClient
    attr_accessor :access_token
    
    def initialize(token)
      @access_token = token
    end

    def test_connection
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::TEST_ENDPOINT + access_token.to_s)
      JSON.parse Net::HTTP.get(uri)
    end

    def languages
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::LANGUAGES_ENDPOINT + access_token.to_s)
      JSON.parse Net::HTTP.get(uri)
    end

    def send_submission(source_code, language, input)
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::SUBMISSIONS_ENDPOINT + access_token.to_s)
      response = Net::HTTP.post_form(uri, {'sourceCode' => source_code, 'language' => language, 'input' => input})
      JSON.parse response.body
    end
  end
end