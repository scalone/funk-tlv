# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version.rb'

Gem::Specification.new do |spec|
  spec.name          = "funk-tlv"
  spec.version       = FunkTlv::VERSION
  spec.authors       = ["Thiago Scalone"]
  spec.email         = ["thiago@cloudwalk.io"]
  spec.summary       = "Hash Ber TLV implementation"
  spec.description   = "Implements Hash Ber TLV on funk environment"
  spec.homepage      = "https://github.com/scalone/funk-tlv"
  spec.license       = "MIT"
  spec.files         = %w(.gitignore Gemfile Gemfile.lock README.md Rakefile funk-tlv.gemspec lib/version.rb out/funk-tlv/main.mrb)
  spec.extensions    = []
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
