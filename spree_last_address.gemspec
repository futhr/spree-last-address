# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "spree_last_address/version"

Gem::Specification.new do |s|
  s.name        = 'spree_last_address'
  s.version     = SpreeLastAddress.version
  s.summary     = "Prefill address with last-used address"
  s.description = "During checkout, causes the address to be prefilled with the address from their most recent order or the user's saved address."

  s.authors     = ['Tyler Rick', 'Torsten Rüger']
  s.email       = 'tyler.rick@k3integrations.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ["lib"]
  s.platform      = Gem::Platform::RUBY

  s.add_dependency('spree_core', '~> 1.0')

  # Soft requirement if using Spree > 1.2, since spree_auth_devise is now what provides
  # user.bill_address association:
  #s.add_development_dependency('spree_auth_devise', '~> 1.2')
end
