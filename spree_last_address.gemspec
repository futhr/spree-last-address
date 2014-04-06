# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)
require 'spree_last_address/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree-last-address'
  s.version      = SpreeLastAddress.version
  s.summary      = "Prefill address with last-used address"
  s.description  = "During checkout, causes the address to be prefilled with the address from their most recent order or the user's saved address."

  s.author       = 'Torsten Rüger'
  s.email        = 'torsten@villataika.fi'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'

  s.add_dependency 'spree_core', '~> 1.0'
end
