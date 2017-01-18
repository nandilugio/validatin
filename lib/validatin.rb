require "forwardable"

require_relative "validatin/version"
require_relative "validatin/structure_check"
require_relative "validatin/remote_syntax_check"

class Validatin
  extend Forwardable

  def initialize(tin, country_code = nil)
    @tin = tin.to_s.strip
    @country_code = country_code ? country_code.downcase.to_sym : nil
  end

  def_delegators :@tin, :empty?
  alias_method :blank?, :empty?

  def valid_structure?
    StructureCheck.new(@tin, @country_code).valid?
  end

  def valid_syntax?
    raise "Must supply country code to perform remote syntax validation." unless @country_code
    RemoteSyntaxCheck.new(@tin, @country_code).valid?
  end

  def valid?
    valid_structure? && valid_syntax?
  end
end
