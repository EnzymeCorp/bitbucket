# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('lib', __dir__)
require File.expand_path('lib/bitbucket_rest_api/version', __dir__)

Gem::Specification.new do |gem|
  gem.name          = 'bitbuckets'
  gem.authors       = ['Enzyme']
  gem.email         = 'noreply@enzyme.com'
  gem.homepage      = 'https://github.com/EnzymeCorp/bitbucket'
  gem.summary       = 'Ruby wrapper for the BitBucket API supporting OAuth and Basic Authentication'
  gem.description   = 'Ruby wrapper for the BitBucket API supporting OAuth and Basic Authentication'
  gem.version       = BitBucket::VERSION::STRING.dup
  gem.license       = 'MIT'

  gem.files = Dir['Rakefile', '{lib,spec}/**/*', 'README*', 'LICENSE*']
  gem.require_paths = %w[lib]

  gem.add_dependency 'faraday', '~> 0.17.3'
  gem.add_dependency 'faraday_middleware', '~> 0.13.1'
  gem.add_dependency 'hashie'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'nokogiri', '>= 1.5.2'
  gem.add_dependency 'simple_oauth'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry-byebug'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '>= 0'
  gem.add_development_dependency 'simplecov', '~> 0.6.1'
  gem.add_development_dependency 'vcr', '~> 2.2.0'
  gem.add_development_dependency 'webmock', '~> 1.8.0'
end
