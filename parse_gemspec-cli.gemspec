# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parse_gemspec/cli/version'
require 'parse_gemspec/cli/constants'

Gem::Specification.new do |spec|
  spec.name          = 'parse_gemspec-cli'
  spec.version       = ParseGemspec::Cli::VERSION
  spec.authors       = ['sanemat']
  spec.email         = ['o.gata.ken@gmail.com']

  spec.summary       =
    'CLI for parsing *.gemspec file'
  spec.description   =
    'CLI for parsing *.gemspec file'
  spec.homepage      = ParseGemspec::Cli::HOMEPAGE
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   =
    spec
      .files
      .grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'parse_gemspec'
  spec.add_dependency 'multi_json'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
end
