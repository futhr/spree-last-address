# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_last_address/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_last_address'
  s.version      = SpreeLastAddress.version
  s.summary      = 'Prefill address with last-used address'
  s.description  = %q{During checkout, causes the address to be prefilled with the address from their most recent order or the user's saved address.}
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = ['Tobias Bohwalli', 'Torsten Rüger']
  s.email        = 'hi@futhr.io'
  s.homepage     = 'http://github.com/futhr/spree_last_address'
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'spree_core', '~> 2.3.0.beta'

  s.add_development_dependency 'capybara', '~> 2.2.1'
  s.add_development_dependency 'poltergeist', '1.5.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 2.14'
  s.add_development_dependency 'sqlite3', '~> 1.3.9'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'database_cleaner', '~> 1.2.0'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'sass-rails', '~> 4.0.0'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'coveralls'
end
