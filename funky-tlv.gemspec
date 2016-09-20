# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'funky-tlv.rb'

Gem::Specification.new do |spec|
  spec.name          = "funky-tlv"
  spec.version       = FunkyTlv::VERSION
  spec.authors       = ["Thiago Scalone"]
  spec.email         = ["thiago@cloudwalk.io"]
  spec.summary       = "Hash Ber TLV implementation"
  spec.description   = "Implements Hash Ber TLV on funk environment"
  spec.homepage      = "https://github.com/scalone/funky-tlv"
  spec.license       = "MIT"
  spec.files         = %w(.gitignore Gemfile Gemfile.lock README.md Rakefile funky-tlv.gemspec lib/funky-tlv.rb lib/hash-ber-tlv.rb out/funky-tlv/main.mrb)
  spec.extensions    = []
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
