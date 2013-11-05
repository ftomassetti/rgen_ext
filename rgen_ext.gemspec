# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rgen/ext/version'

Gem::Specification.new do |spec|
  spec.name          = "rgen_ext"
  spec.version       = RgenExt::VERSION
  spec.authors       = ["Federico Tomassetti"]
  spec.email         = ["f.tomassetti@gmail.com"]
  spec.description   = %q{Extensions of general use to RGen}
  spec.summary       = %q{Extensions of general use to RGen}
  spec.homepage      = "http://github.com/ftomassetti/rgen_ext"
  spec.license       = "Apache License v2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rgen"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
end
