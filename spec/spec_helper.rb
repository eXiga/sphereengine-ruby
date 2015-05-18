require 'sphereengine-ruby'
require 'rspec'

require 'coveralls'
Coveralls.wear!

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
end

require 'webmock/rspec'
WebMock.disable_net_connect!(allow: 'coveralls.io')