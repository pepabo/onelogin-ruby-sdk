=begin
#OneLogin API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 3.0.0-alpha.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.0.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for OneLogin::GenerateTokenRequest
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe OneLogin::GenerateTokenRequest do
  let(:instance) { OneLogin::GenerateTokenRequest.new }

  describe 'test an instance of GenerateTokenRequest' do
    it 'should create an instance of GenerateTokenRequest' do
      expect(instance).to be_instance_of(OneLogin::GenerateTokenRequest)
    end
  end
  describe 'test attribute "grant_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["client_credentials"])
      # validator.allowable_values.each do |value|
      #   expect { instance.grant_type = value }.not_to raise_error
      # end
    end
  end

end