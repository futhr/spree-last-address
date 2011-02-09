Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_last_address'
  s.version     = '0.0.3'
  s.summary     = 'Add gem summary here'
  s.description = 'Grab the last (spree) orders address'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Torsten Ruger'
  s.email             = 'torsten@lightning.nu'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'actionmailer'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.0')
end