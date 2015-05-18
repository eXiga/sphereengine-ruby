require 'coveralls'
Coveralls.wear!

require 'sphereengine-ruby'
require 'rspec'

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
end

require 'webmock/rspec'
WebMock.disable_net_connect!(allow: 'coveralls.io')

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end