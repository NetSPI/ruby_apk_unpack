# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ApkUnpack"
  spec.version       = "0.0.1"
  spec.authors       = ["Abdullah"]
  spec.email         = ["abdullah.munawar@nvisiumsecurity.com"]
  spec.summary       = %q{my first ruby gem.}
  spec.description   = %q{my first ruby gem.}
  spec.homepage      = ""
  spec.license       = "MIT"
  
  spec.files        = %w(LICENSE.txt README.md)
  spec.files       += Dir.glob('bin/**/*')
  spec.files	   += Dir.glob('lib/**/*')
  spec.files       += Dir.glob('spec/**/*')
  spec.test_files   = Dir.glob('spec/**/*')
  spec.executables  = %w(apk_unpack)
  spec.require_path = '.'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
