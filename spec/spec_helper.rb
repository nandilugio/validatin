require "validatin"

RSpec.configure do |config|
  config.before(:suite) do
    VALID_AT_TIN = "12-123/1234"
    VALID_ES_TIN = "X9722412J"
    INVALID_TIN = "INVALID!"

    Validatin::REGEX_FORMATS_BY_COUNTRY = {
        at: [%r(^\d{2}-\d{3}/\d{4}$), %r(^\d{9}$)],
        es: %r(^[\dLKXYZM]\d{7}[[:alpha:]]$),
        sk: nil,
    }
  end

  # RSpec::Expectations.configuration.on_potential_false_positives = :nothing
end
