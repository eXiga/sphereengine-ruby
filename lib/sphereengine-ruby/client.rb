require 'json'

module SphereEngine
  class SphereEngineClient
    attr_accessor :access_token
    
    def initialize(token)
      @access_token = token
    end

    def test_connection
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::TEST_ENDPOINT)
      uri.query = URI.encode_www_form({"access_token" => access_token})
      JSON.parse Net::HTTP.get_response(uri).body
    end

    def languages
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::LANGUAGES_ENDPOINT)
      uri.query = URI.encode_www_form({"access_token" => access_token})
      JSON.parse Net::HTTP.get_response(uri).body
    end

    def send_submission(source_code, language, input)
      uri = URI(SphereEngine::Request::BASE_URL + SphereEngine::Request::SUBMISSIONS_ENDPOINT)
      uri.query = URI.encode_www_form({"access_token" => access_token})
      response = Net::HTTP.post_form(uri, {'sourceCode' => source_code, 'language' => language, 'input' => input})
      JSON.parse response.body
    end

    def fetch_submission(id, with_source = true, 
                             with_input = true, 
                             with_output = true, 
                             with_stderr = true, 
                             with_cmpinfo = true)
      uri = URI(SphereEngine::Request::BASE_URL + 
                SphereEngine::Request::FETCH_SUBMISSION_ENDPOINT.sub(':id', id.to_s))
      uri.query = URI.encode_www_form({"access_token" => access_token,
                                       "withSource" => with_source, 
                                       "withInput" => with_input, 
                                       "withOutput" => with_output,
                                       "withStderr" => with_stderr,
                                       "withCmpinfo" => with_cmpinfo})
      JSON.parse Net::HTTP.get_response(uri).body
    end
  end
end