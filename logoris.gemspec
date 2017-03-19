# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logoris'

Gem::Specification.new do |spec|
  spec.name          = "logoris"
  spec.version       = Logoris::VERSION
  spec.authors       = ["Kent Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{A simple, unified interface to manage logging for command-line applications to the appropriate standard stream.}   
  spec.description   = %q{Logoris a Ruby gem that provides a simple, unified interface to manage logging for command-line applications to the appropriate standard stream. Do you hate having to manage your standard streams? Are your stderr events actually going to stdout, and you're like "whoa I didn't even know?" -- and you want a simple way to do this? You silly rabbit you: this is the gem for you.} 
  spec.homepage      = "https://github.com/picatz/logoris"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
