# frozen_string_literal: true

module Providers
  module Api
    class Common
      FAILED_MESSAGE = "Failed to fetch a response"

      attr_reader :currency, :contracts, :technologies, :seniority, :keywords

      def initialize(currency:, contracts:, technologies:, seniority:, keywords:)
        @currency = currency
        @contracts = contracts
        @technologies = technologies
        @seniority = seniority
        @keywords = keywords
      end

      def fetch_data(api_path, **params)
        HTTParty.post(api_path, headers:, **params)
      end

      def failed_response
        raise ::Api::Errors::BadRequest, FAILED_MESSAGE
      end

      private

      def headers
        { "Content-Type": "application/json" }
      end
    end
  end
end
