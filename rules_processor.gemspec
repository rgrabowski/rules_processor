# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rules_processor/version'

Gem::Specification.new do |spec|
  spec.name          = 'rules_processor'
  spec.version       = RulesProcessor::VERSION
  spec.authors       = ['Rafal Grabowski']
  spec.email         = ['rafal.grabowski@gmail.com']

  spec.summary       = %q{Business Rules Processor.}
  spec.description   = %q{A simple business rules processor.}
  spec.homepage      = 'https://github.com/rgrabowski/rules_processor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
