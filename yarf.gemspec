# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yarf/version'

Gem::Specification.new do |spec|
  spec.name          = "yarf"
  spec.version       = Yarf::VERSION
  spec.authors       = ["Mário Nzualo"]
  spec.email         = ["mario.nzualo@gmail.com"]

  spec.summary       = %q{Yet Another Ruby Framework - a tiny web framework based on Rack}
  spec.homepage      = "https://github.com/marionzualo/yarf"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "rack"
  spec.add_development_dependency "rspec", "~> 3.4", ">= 3.4.0"
  spec.add_dependency "immutable-struct", "~> 2.2", ">= 2.2.2"
  spec.add_dependency "activesupport", "~> 5.0", ">= 5.0.0.1"
end
