# frozen_string_literal: true

require "test_helper"

module Providers
  module Api
    class CommonTest < ActiveSupport::TestCase
      attr_reader :common, :api_path, :expected_response

      setup do
        @common = Common.new(currency: "USD", contracts: [], technologies: [], seniority: [], keywords: [])
        @api_path = "https://api.example.com/data"
        @expected_response = { test: "test" }
        mock_request
      end

      test ".fetch_data" do
        response = common.fetch_data(api_path)

        assert_equal 200, response.code
        assert_equal expected_response.as_json, response.parsed_response
      end

      test ".failed_response raises Api::Errors::BadRequest" do
        exception = assert_raise(::Api::Errors::BadRequest) { common.failed_response }

        assert_equal Common::FAILED_MESSAGE, exception.message
      end

      private

      def mock_request
        stub_request(:post, api_path)
          .to_return(status: 200, body: expected_response.to_json, headers: { "Content-Type": "application/json" })
      end
    end
  end
end
