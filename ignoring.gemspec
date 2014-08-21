# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ignoring/version'

Gem::Specification.new do |spec|
  spec.name          = "ignoring"
  spec.version       = Ignoring::VERSION
  spec.authors       = ["Kristen Mills"]
  spec.email         = ["kristen@kristen-mills.com"]
  spec.summary       = "Tool for managing gitignores"
  spec.description   = "Tool for managing gitignores"
  spec.homepage      = "https://github.com/kristenmills/ignoring"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "git", "~> 1.2.8"
  spec.add_dependency "highline", "~> 1.6"
  spec.add_dependency "terminal-table", "~> 1.4.5"
end
