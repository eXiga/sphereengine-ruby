module SphereEngine
  class SphereEngineClient
    attr_accessor :access_token
    def initialize(token)
      @access_token = token
    end
  end
end