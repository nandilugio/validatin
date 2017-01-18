class Validatin
  class StructureCheck
    def initialize(tin, country_code = nil)
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

      country_codes.flat_map do |country_code|
        REGEX_FORMATS_BY_COUNTRY[country_code]
      end.compact.uniq
    end

    def supported_country_codes
      REGEX_FORMATS_BY_COUNTRY.keys
    end

    # From https://ec.europa.eu/taxation_customs/tin/tinByCountry.html
    REGEX_FORMATS_BY_COUNTRY = {
        at: [%r(^\d{2}-\d{3}/\d{4}$), %r(^\d{9}$)],
        be: %r(^\d{11}$),
        bg: %r(^\d{10}$),
        cy: %r(^\d{8}[[:alpha:]]$),
        cz: %r(^\d{6}/?\d{3,4}$),
        de: %r(^\d{11}$),
        dk: %r(^\d{6}-?\d{4}$),
        ee: %r(^\d{11}$),
        el: %r(^\d{9}$),
        es: %r(^[\dLKXYZM]\d{7}[[:alpha:]]$),
        fi: %r(^\d{6}[+-A]\d{3}[[:alpha:]]$),
        fr: [%r(^[0123]\d \d{2} \d{3} \d{3} \d{3}$), %r(^[0123]\d{12}$)],
        hr: %r(^\d{11}$),
        hu: %r(^\d{10}$),
        ie: %r(^\d{7}[[:alpha:]]{1,2}$),
        it: %r(^[[:alpha:]]{6}\d{2}[[:alpha:]]\d{2}[[:alpha:]]\d{3}[[:alpha:]]$),
        lt: %r(^\d{11}$),
        lu: %r(^\d{13}$),
        lv: %r(^[0123]\d[01]\d{7}$),
        mt: [%r(^\d{3,7}[MGAPLHBZ]$), %r(^\d{9}$)],
        nl: %r(^\d{9}$),
        pl: %r(^\d{10,11}$),
        pt: %r(^\d{9}$),
        ro: %r(^\d{13}$),
        se: %r(^\d{6}[-+]?\d{4}$),
        sl: %r(^\d{8}$),
        sk: nil,
        uk: [%r(^\d{10}$), %r(^[[:alpha:]]{2}\d{6}[ABCD]$)],
    }
  end
end
