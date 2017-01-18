# Validatin

Validates structure (locally in terms of allowed characters) and syntax (remotely via API, taking into account undisclosed checksums, etc.) for [european Tax Identification Numbers (TIN)](https://ec.europa.eu/taxation_customs/business/tax-cooperation-control/administrative-cooperation/tax-identification-numbers-tin_en) as [specified](https://ec.europa.eu/taxation_customs/tin/tinByCountry.html) by the [European Commission](http://ec.europa.eu/).
Existence or other information is not retrieved.

## Installation

```bash
$ gem install validatin
```

## Usage

```ruby
# @param TIN [String] The full european Tax Identification Number (mandatory)
# @param country_code [Symbol] The country code for the country (optional for local structure check `#valid_structure?`) 
tin = Validatin.new("12-123/1234", :at)                    

# Performs a local check for the structure of the TIN
tin.valid_structure?

# Performs a remote check for the syntax of the TIN, taking into account (undisclosed) checksum calculations, etc.
# Uses the European Commission SOAP webservice found at https://ec.europa.eu/taxation_customs/tin/tinRequest.html
tin.valid_syntax?

# Performs a local check for the structure of the TIN and if valid, performs the remote syntax check
tin.valid?
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/camaloon/validatin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
