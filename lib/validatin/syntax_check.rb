class Validatin
  private

  class SyntaxCheck
    def initialize(tin, country_code)
      @tin = tin
      @country_code = country_code
    end

    def valid?
      applicable_regex_formats.any? { |regex_format| @tin =~ regex_format }
    end

    private

    def applicable_regex_formats
      country_codes = if @country_code
                        if supported_country_codes.include?(@country_code)
                          [@country_code]
                        else
                          []
                        end
                      else
                        supported_country_codes
                      end

      country_codes.flat_map { |country_code| REGEX_FORMATS_BY_COUNTRY[country_code] }
    end

    def supported_country_codes
      REGEX_FORMATS_BY_COUNTRY.keys
    end

    REGEX_FORMATS_BY_COUNTRY = {
        at: [%r(^\d{2}-\d{3}/\d{4}$), %r(^\d{9}$)],
        be: %r(^\d\d\d\d\d\d\d\d\d\d\d$)
    }
  end
end
