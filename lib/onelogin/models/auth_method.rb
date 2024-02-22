=begin
#OneLogin API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 3.0.0-alpha.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.0.1

=end

require 'date'
require 'time'

module OneLogin
  class AuthMethod
    N0 = 0.freeze
    N1 = 1.freeze
    N2 = 2.freeze
    N3 = 3.freeze
    N4 = 4.freeze
    N6 = 6.freeze
    N7 = 7.freeze
    N8 = 8.freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = AuthMethod.constants.select { |c| AuthMethod::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #AuthMethod" if constantValues.empty?
      value
    end
  end
end
