require "forwardable"

require_relative "validatin/version"
require_relative "validatin/api_check"
require_relative "validatin/syntax_check"

class Validatin
  extend Forwardable

  def initialize(tin, country_code = nil)
    @tin = tin.to_s.strip
    @country_code = country_code ? country_code.downcase.to_sym : nil
  end

  def_delegators :@tin, :empty?
  alias_method :blank?, :empty?

  def syntax_valid?
    SyntaxCheck.new(@tin, @country_code).valid?
  end

  def valid?
    raise "Must supply country code to perform API validation." unless @country_code

    syntax_valid? && ApiCheck.new(@tin, @country_code).valid?
  end
end
