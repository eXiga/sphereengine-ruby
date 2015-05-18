module SphereEngine
  module Request
    BASE_URL = 'http://api.compilers.sphere-engine.com/api/v3'
    ACCESS_TOKEN = 'access_token='
    TEST_ENDPOINT = '/test?' + ACCESS_TOKEN
    LANGUAGES_ENDPOINT = '/languages?' + ACCESS_TOKEN
    SUBMISSIONS_ENDPOINT = '/submissions?' + ACCESS_TOKEN
    FETCH_SUBMISSION_ENDPOINT = '/submissions/:id?' + ACCESS_TOKEN
  end
end