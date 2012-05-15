# -*- encoding: utf-8 -*-
require File.expand_path('../lib/santoku/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin Nuckolls"]
  gem.email         = ["kevin.nuckolls@gmail.com"]
  gem.description   = "a wrapper for knife that helps you build up processes around chef"
  gem.summary       = ""
  gem.homepage      = "http://www.github.com/knuckolls/santoku"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "santoku"
  gem.require_paths = ["lib"]
  gem.version       = Santoku::VERSION
  
  gem.add_dependency "chef"
  gem.add_dependency "httparty"
  gem.add_dependency "app_conf"
end
