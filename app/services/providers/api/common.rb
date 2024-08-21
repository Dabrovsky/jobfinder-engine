# frozen_string_literal: true

module Providers
  module Api
    class Common
      FAILED_MESSAGE = "Failed to fetch a response"

      attr_reader :currency, :technology

      def initialize(currency: "USD", technology: "")
        @currency = currency
        @technology = technology
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
