$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'sphereengine/version'

Gem::Specification.new do |s|
  s.name = 'sphereengine-ruby'
  s.version = SphereEngine::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.license = 'MIT'
  s.authors = ['Anton Kostenich']
  s.email = 'anton.kostenich@hotmail.com'
  s.homepage = 'https://github.com/eXiga/sphereengine-ruby'
  s.summary = "sphereengine-ruby-#{SphereEngine::Version::STRING}"
  s.description = 'Ruby client for SphereEngine service'
  s.files = %w(README.md sphereengine-ruby.gemspec) + Dir['lib/**/*.rb']
end