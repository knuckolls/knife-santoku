# -*- encoding: utf-8 -*-
require File.expand_path('../lib/knife_santoku/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin Nuckolls"]
  gem.email         = ["kevin.nuckolls@gmail.com"]
  gem.description   = "A drop in replacement for knife that helps you build out processes around Chef"
  gem.summary       = ""
  gem.homepage      = "http://www.github.com/knuckolls/knife-santoku"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "knife-santoku"
  gem.require_paths = ["lib"]
  gem.version       = KnifeSantoku::VERSION
  
  gem.add_dependency "chef"
  gem.add_dependency "httparty"
  gem.add_dependency "app_conf"
  gem.add_dependency "tinder"
  gem.add_dependency "pony"
end
