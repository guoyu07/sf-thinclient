# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sf-thinclient/version'

Gem::Specification.new do |gem|
  gem.name          = "sf-thinclient"
  gem.version       = Thinclient::VERSION
  gem.authors       = ["wangbaomi"]
  gem.email         = ["system1029@gmail.com"]
  gem.description   = %q{SSL ThinClient}
  gem.summary       = %q{Image match, keyboard..}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
