require 'sphereengine-ruby'
require 'rspec'

require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'
WebMock.disable_net_connect!(allow: 'coveralls.io')