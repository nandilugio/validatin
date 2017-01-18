# coding: utf-8
require_relative "lib/validatin/version"

Gem::Specification.new do |gem|
  gem.name          = "validatin"
  gem.summary       = "Tax Identification Numbers (TIN) validation."
  gem.description   = "Validate european Tax Identification Numbers (TIN) as specified by the European Commission."
  gem.homepage      = "https://github.com/camaloon/validatin"
  gem.license       = "MIT"
  gem.authors       = ["Fernando Stecconi"]
  gem.email         = ["dev@camaloon.com"]

  gem.version       = Validatin::VERSION

  gem.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^lib/}) }

  gem.add_runtime_dependency "savon", "~> 2.11", ">= 2.11.0"
  gem.add_development_dependency "rspec", "~> 3.0"
end
