# frozen_string_literal: true

require "test_helper"

module Providers
  class FetchTest < ActiveSupport::TestCase
    include MockedDataHelpers

    setup do
      stub_nofluffjobs_data
    end

    test "fetch class inherits from Command class" do
      assert_equal Command, Fetch.superclass
    end

    test "Returns an array as response" do
      input = { provider: "nofluffjobs" }
      output = Fetch.new(**input).call

      assert_equal 1, output.count
    end

    test "Stores fetched records in the database" do
      input = { provider: "nofluffjobs" }
      expected_changes = {
        -> { JobOffer.count } => 1
      }

      assert_difference(expected_changes) do
        Fetch.new(**input).call
      end
    end

    test "raises Api::Errors::ValidationError when provider is not provided" do
      input = {}

      exception = assert_raise(::Api::Errors::ValidationError) { Fetch.new(**input).call }

      assert_equal Fetch::INVALID_PARAMETER_ERROR, exception.message
      assert_instance_of ActiveData::ValidationError, exception.cause
    end

    test "raises Api::Errors::ValidationError when provider is invalid" do
      input = { provider: "invalid" }

      exception = assert_raise(::Api::Errors::ValidationError) { Fetch.new(**input).call }

      assert_equal Fetch::INVALID_PARAMETER_ERROR, exception.message
      assert_instance_of ActiveData::ValidationError, exception.cause
    end
  end
end
