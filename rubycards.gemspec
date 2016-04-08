# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubycards/version'

Gem::Specification.new do |gem|
  gem.name          = 'rubyrummy'
  gem.version       = RubyCards::VERSION
  gem.authors       = ['theory friction practice', 'Jordan Scales', 'Joe Letizia', 'Justin Workman']
  gem.email         = ['jackson.brebnor@gmail.com', 'scalesjordan@gmail.com', 'joe.letizia@gmail.com', 'xtagon@gmail.com']
  gem.description   = 'Rummy game based on RubyCards'
  gem.licenses      = ['MIT']
  gem.summary       = 'An implementation of Rummy card game gem'
  gem.homepage      = 'https://github.com/tfpractice/rubyrummy'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('colored', '~> 1.2')
end
