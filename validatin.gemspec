# coding: utf-8
require_relative "lib/validatin/version"

Gem::Specification.new do |gem|
  gem.name          = "validatin"
  gem.version       = Validatin::VERSION
  gem.authors       = ["Fernando Stecconi"]
  gem.email         = ["dev@camaloon.com"]

  gem.summary       = "Validate european Tax Identification Numbers (TIN) as specified by the European Commission."
  gem.homepage      = "https://github.com/camaloon/validatin"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^lib/}) }

  gem.add_development_dependency "rspec", "~> 3.0"
end
