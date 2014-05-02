# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n/mongodb/version'

Gem::Specification.new do |spec|
  spec.name          = "i18n-mongodb"
  spec.version       = I18n::Mongodb::VERSION
  spec.authors       = ["Antonio Lorusso"]
  spec.email         = ["antonio.lorusso@gmail.com"]
  spec.summary       = %q{Rails I18n backend for MongoDB}
  spec.description   = %q{Rails I18n backend for MongoDB}
  spec.homepage      = "http://antoniolorusso.com/i18n-mongodb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
