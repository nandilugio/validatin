# coding: utf-8
require_relative "lib/validatin/version"

Gem::Specification.new do |gem|
  gem.name = "validatin"
  gem.summary = "Tax Identification Numbers (TIN) validation."
  gem.description = <<-DESCRIPTION.gsub(/\s+/, " ")
    Validates structure (locally in terms of allowed characters) and syntax (remotely via API, taking into account
    undisclosed checksums, etc.) for european Tax Identification Numbers (TIN) as specified by the European Commission.
    Existence or other information is not retrieved.
  DESCRIPTION

  gem.homepage = "https://github.com/camaloon/validatin"
  gem.license = "MIT"
  gem.authors = ["Fernando Stecconi"]
  gem.email = ["dev@camaloon.com"]

  gem.version = Validatin::VERSION

  gem.files = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^lib/}) }

  gem.add_runtime_dependency "savon", "~> 2.11", ">= 2.11.0"

  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "webmock", "~> 2.3", ">= 2.3.2"
  gem.add_development_dependency "vcr", "~> 3.0", ">= 3.0.3"
end
