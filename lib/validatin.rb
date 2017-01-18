require 'forwardable'

require_relative "validatin/version"
require_relative "validatin/syntax_check"

class Validatin
  extend Forwardable

  def initialize(tin, country_code = nil)
    @tin = tin.to_s.strip
    @country_code = country_code ? country_code.to_sym : nil
  end

  def_delegators :@tin, :empty?
  alias_method :blank?, :empty?

  def valid?
    SyntaxCheck.new(@tin, @country_code).valid?
  end
end
