# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foomatic/version'

Gem::Specification.new do |gem|
  gem.name          = "ruby-foomatic"
  gem.version       = Foomatic::VERSION
  gem.authors       = ["Edgars Beigarts"]
  gem.email         = ["edgars.beigarts@gmail.com"]
  gem.description   = "Ruby interface to the Foomatic printer database"
  gem.summary       = "Ruby interface to the Foomatic printer database"
  gem.homepage      = "http://github.com/ebeigarts/ruby-foomatic"

  gem.files         = Dir.glob("lib/**/*") + %w(README.md LICENSE)
  gem.test_files    = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "nokogiri", "~> 1.5"

  gem.add_development_dependency "rake", "~> 0.9.2.2"
  gem.add_development_dependency "rspec", "~> 2.11"
end
