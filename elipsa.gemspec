# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elipsa/version'

Gem::Specification.new do |spec|
  spec.name          = 'elipsa'
  spec.version       = Elipsa::VERSION
  spec.authors       = ['Ryan Biesemeyer']
  spec.email         = ['ryan@yaauie.com']
  spec.summary       = 'Smart string truncation'
  spec.description   = <<-EODESC
    Elipsa is a tool for conditionally and smartly truncating a string to a
    specific length. It pays attention to word-boundaries, and tries to give
    you as much of the string as it can, while still fitting your parameters.
  EODESC
  spec.homepage      = 'https://github.com/yaauie/elipsa'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
