# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "apk_unpack"
  spec.version       = "0.0.1"
  spec.authors       = ["Abdullah Munawar", "Marcus Richardson", "Riandi Wiguna", "Ken Johnson"]
  spec.email         = ["abdullah.munawar@nvisiumsecurity.com"]
  spec.summary       = %q{
                        A ruby gem intended to simplify decompiling APK files.
                        }
  spec.description   = %q{
                        The APKUnpack tool is used to quickly decompile one or more APK applications essentially automating a     simple but time consuming task. This tool requires that you have the APKTool and Dex2Jar applications on your machine.
                        }
  spec.homepage      = "http://nvisium.github.io/ruby_apk_unpack/"
  spec.license       = "MIT"
  
  spec.files        = %w(LICENSE.txt README.md)
  spec.files       += Dir.glob('bin/**/*')
  spec.files	     += Dir.glob('lib/**/*')
  spec.files       += Dir.glob('spec/**/*')
  spec.test_files   = Dir.glob('spec/**/*')
  spec.executables  = %w(apk_unpack)
  spec.require_path = '.'
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
