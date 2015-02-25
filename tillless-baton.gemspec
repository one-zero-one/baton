# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tillless-baton/version'

Gem::Specification.new do |gem|
  gem.name          = "tillless-baton"
  gem.version       = Tillless::Baton::VERSION
  gem.authors       = ["Matthew Sinclair"]
  gem.email         = ["matthew.sinclair@tillless.com"]
  gem.description   = %q{A rubygem for coordinating Tillless interactions with scripted infrastructure like AWS and Heroku}
  gem.summary       = %q{A rubygem for coordinating Tillless interactions with scripted infrastructure like AWS and Heroku}
  gem.homepage      = "http://www.tillless.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'faraday'                  #, '~> 0.9.1'
  gem.add_dependency 'faraday_middleware'       #, '~> 0.9.1'
  gem.add_dependency 'hashie'                   #, '~> 3.3.2'
  gem.add_dependency 'multi_json'               #, '~> 1.10.1'

  gem.add_development_dependency 'webmock'      #, '~> 1.20.4'
  gem.add_development_dependency 'vcr'          #, '~> 2.9.3'
  gem.add_development_dependency 'rake'         #, '~> 10.4.2'
  gem.add_development_dependency 'rspec'        #, '~> 3.1.0'
  gem.add_development_dependency 'factory_girl' #, '~> 4.5.0'
  gem.add_development_dependency 'rb-fsevent'   #, '~> 0.9.4'
  gem.add_development_dependency 'guard-rspec'  #, '~> 4.5.0'
end
