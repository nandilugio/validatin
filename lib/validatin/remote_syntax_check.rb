require "savon"

class Validatin
  class RemoteSyntaxCheck
    def initialize(tin, country_code)
      @tin = tin
      @country_code = country_code
    end

    def valid?
      @response ||= request_with_retries!
      !!(@response[:valid_structure] && @response[:valid_syntax])
    rescue SocketError => e #TODO: error handling
      nil
    end

    private

    WSDL_URL = "https://ec.europa.eu/taxation_customs/tin/checkTinService.wsdl"

    def client
      @client ||= Savon.client(wsdl: WSDL_URL, log: false)
    end

    def request!
      response = client.call(:check_tin, message: {
          country_code: @country_code.upcase,
          tin_number: @tin
      })
      response.body[:check_tin_response]
    end

    def request_with_retries!(retry_times = 2)
      request!
    rescue SocketError => e
      if retry_times > 0
        request_with_retries!(retry_times - 1)
      else
        raise e
      end
    end
  end
end
